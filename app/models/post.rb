class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  attr_accessible :body, :title, :tag

  validates_presence_of :title, :body, :author, :slug

  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :parent_comments, class_name: "Comment", conditions: { parent_comment_id: nil }
  
  def tag?
    tag.present?
  end
 
end
