# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  active     :boolean          not null
#

class Conversation < ActiveRecord::Base
  has_many :conversation_participants
  has_many :messages
  has_many :participants, through: :conversation_participants, source: :user

  def self.find_by_ids(first_id, second_id)
    Conversation.includes(:participants).select do |conversation|
      participants = Set.new(conversation.participants.map { |p| p.id })
      participants.include?(first_id) && participants.include?(second_id)
    end
  end

  def terminate
    self.update_attributes!({ active: false })
  end
end
