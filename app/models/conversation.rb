# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Conversation < ActiveRecord::Base
  has_many :conversation_participants
  has_many :messages
  has_many :participants, through: :conversation_participants, source: :user
end
