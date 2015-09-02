class CreateConversationParticipants < ActiveRecord::Migration
  def change
    create_table :conversation_participants do |t|
      t.integer :user_id, null: false
      t.integer :conversation_id, null: false

      t.timestamps null: false
    end

    add_index :conversation_participants, [:user_id, :conversation_id], unique: true
  end
end
