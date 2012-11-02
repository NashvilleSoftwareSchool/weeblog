class Post < ActiveRecord::Base
  attr_accessible :body, :title

  validates_presence_of :title, :body

  has_many :comments
  has_many :parent_comments, class_name: "Comment", conditions: { parent_comment_id: nil }
end
