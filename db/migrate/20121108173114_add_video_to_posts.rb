class AddVideoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :video_title, :string
    add_column :posts, :video_url, :string
  end
end
