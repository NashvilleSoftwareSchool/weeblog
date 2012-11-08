class AddMediaToPost < ActiveRecord::Migration
  def change
    add_column :posts, :media, :string
  end
end
