# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  subject         :string           not null
#  body            :text             not null
#  conversation_id :integer          not null
#  from_id         :integer          not null
#  to_id           :integer          not null
#  active          :boolean          not null
#  read            :boolean          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Message < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: 'from_id'
  belongs_to :recipient, class_name: 'User', foreign_key: 'to_id'
  belongs_to :conversation
end
