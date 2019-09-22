class CreatePostSub < ActiveRecord::Migration[5.2]
  def change
    create_table :post_subs do |t|
      t.integer :sub_id
      t.integer :post_id

      t.timestamps
    end
    add_index :post_subs, [:sub_id, :post_subs]
  end
end
