class RemoveColumnsFromPostsComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :author, :string, null: true
    remove_column :post_comments, :creator, :string
  end
end
