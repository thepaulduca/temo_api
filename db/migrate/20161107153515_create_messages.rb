class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :user
      t.string :message
      t.string :sentiment

      t.timestamps
    end
  end
end
