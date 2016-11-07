class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.string :sentiment
      t.references :user

      t.timestamps
    end
  end
end
