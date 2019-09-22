class RenameUsersTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :users_tables, :users
  end
end
