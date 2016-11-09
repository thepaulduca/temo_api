class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :phone
      t.references :conversation
      t.timestamps
    end
  end
end
