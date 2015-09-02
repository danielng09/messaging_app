class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.timestamps null: false
      t.boolean :active, null: false
    end

    add_index :conversations, :active
  end
end
