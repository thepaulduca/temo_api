class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.string :sentiment
      t.string :channel_url
      t.references :users

      t.timestamps
    end
  end
end
