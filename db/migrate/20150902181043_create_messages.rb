class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject, null: false
      t.text :body, null: false
      t.integer :conversation_id, null: false
      t.integer :from_id, null: false
      t.integer :to_id, null: false
      t.boolean :read, null: false
      t.timestamps null: false
    end

    add_index :messages, :conversation_id
    add_index :messages, :read
  end
end
