class RemoveCreatorFromPost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :creator
  end
end
