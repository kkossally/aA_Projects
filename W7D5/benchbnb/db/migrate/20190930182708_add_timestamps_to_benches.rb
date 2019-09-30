class AddTimestampsToBenches < ActiveRecord::Migration[5.2]
    def change_table
    add_column :benches, :created_at, :datetime, null: false
    add_column :benches, :updated_at, :datetime, null: false
  end
end
