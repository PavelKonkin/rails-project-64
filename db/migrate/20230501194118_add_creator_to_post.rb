class AddCreatorToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :author, :string, null: true
  end
end
