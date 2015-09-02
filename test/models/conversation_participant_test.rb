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

require 'test_helper'

class ConversationParticipantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
