class AddColumnToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :post_comments, :creator, :string
  end
end
