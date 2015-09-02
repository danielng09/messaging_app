# == Schema Information
#
# Table name: conversation_participants
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  conversation_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ConversationParticipant < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation
end
