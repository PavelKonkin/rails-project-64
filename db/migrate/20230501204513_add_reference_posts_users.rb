class AddReferencePostsUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :creator, foreign_key: { to_table: :users }, null: false
  end
end
