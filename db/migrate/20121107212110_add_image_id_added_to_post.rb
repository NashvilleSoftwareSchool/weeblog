class AddImageIdAddedToPost < ActiveRecord::Migration
  def change
    add_column :posts, :image_id, :integer
  end
end
