class CreateConversationsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations_users do |t|
      t.references :user
      t.references :conversation

      t.timestamps
    end
  end
end
