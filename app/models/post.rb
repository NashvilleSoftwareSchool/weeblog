class Post < ActiveRecord::Base
  attr_accessible :body, :title, :image, :video_title, :video_url

  validates_presence_of :title, :body, :author
  validates :video_url, :presence => true, :if => :video_title_present?
  validates :video_title, :presence => true, :if => :video_url_present?
  
  def video_title_present?
    !self.video_title.blank?
  end
  
  def video_url_present?
    !self.video_url.blank?
  end
  
  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :parent_comments, class_name: "Comment", conditions: { parent_comment_id: nil }
  has_many :images
  mount_uploader :image, ImageUploader

end
