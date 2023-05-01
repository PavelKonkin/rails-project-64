class ChangePostCommentAncestryColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :post_comments, :ancestry, :string, null: true
  end
end
