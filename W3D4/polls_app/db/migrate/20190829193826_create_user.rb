class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
    end
    add_index :users, :name, unique: true
  end
end
