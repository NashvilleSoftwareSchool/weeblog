class Post < ActiveRecord::Base
  attr_accessible :body, :title, :tag

  validates_presence_of :title, :body, :author

  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :parent_comments, class_name: "Comment", conditions: { parent_comment_id: nil }
  
  def tag?
    tag.present?
  end
 
end
