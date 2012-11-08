class Image < ActiveRecord::Base
  attr_accessible :path, :post_id, :title, :image
  mount_uploader :image, ImageUploader
  belongs_to :post
end
