class AddAncestryToPostComment < ActiveRecord::Migration[7.0]
  def change
    add_column :post_comments, :ancestry, :string, null: false
    add_index :post_comments, :ancestry
  end
end
