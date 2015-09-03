# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  homeowner       :boolean          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validate :ensure_session_token
  after_initialize :ensure_session_token

  has_many :conversation_participants
  has_many :conversations, through: :conversation_participants, source: :conversation
  has_many :sent_messages, class_name: 'Message', foreign_key: :from_id

  def create_conversation(user_id)
    raise 'only homeowners can start conversations!' unless self.homeowner
    raise 'user can only message contractors' if User.find(user_id).homeowner

    convo = self.conversations.create!(active: true)
    convo.conversation_participants.create!({user_id: user_id})
    convo
  end

  def send_message(subject, body, *user_ids)
    user_ids.each do |user_id|
      convo = Conversation.find_by_ids(user_id, self.id).first
      unless convo
        convo = create_conversation(user_id)
      end
      convo.messages.create({ to_id: user_id,
                            from_id: self.id,
                            subject: subject,
                            body: body,
                            read: false})
    end
  end

  def terminate_conversation(user_id)
    raise 'only Homeowners can terminate conversations!' unless self.homeowner
    Conversation.find_by_ids(user_id, self.id).first.terminate
  end

  def respond(subject, body, message)
    message.update!({ read: true })
    Message.create!({ to_id: message.from_id,
                     from_id: message.to_id,
                     conversation_id: message.conversation_id,
                     subject: subject,
                     body: body,
                     read: false})
  end

  def active_conversations
    self.conversations.where(active: true)
  end

  def list_messages(conversation)
    conversation.messages
  end

  def unread_messages
    Message.unread_messages(self.id).size
  end

 attr_reader :password

 def self.find_by_credentials(email, password)
   user = User.find_by_email(email)
   if user && user.is_password?(password)
     user
   else
     nil
   end
 end

 def password=(password)
   @password = password
   self.password_digest = BCrypt::Password.create(password)
 end

 def self.generate_session_token
   SecureRandom::urlsafe_base64
 end

 def is_password?(password)
   BCrypt::Password.new(password_digest).is_password?(password)
 end

 def reset_session_token!
     self.session_token = User.generate_session_token
     self.save!
     self.session_token
 end

 private
 def ensure_session_token
   self.session_token ||= User.generate_session_token
 end
end
