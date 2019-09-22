class ChangeAlbumsConstraints < ActiveRecord::Migration[5.2]
  def change
    change_column :albums, :live, :boolean, null: true
  end
end
