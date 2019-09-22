class AddPostsColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :title, :string
    add_column :posts, :url, :string
    add_column :posts, :content, :text
    add_column :posts, :sub_id, :integer
    add_column :posts, :user_id, :integer

    add_index :posts, :sub_id
    add_index :posts, :user_id
  end
end