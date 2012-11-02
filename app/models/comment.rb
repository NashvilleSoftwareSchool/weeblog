class Comment < ActiveRecord::Base
  attr_accessible :commenter, :message, :parent_comment_id

  # This will require a migration to add parent_comment_id:
  # has_many :replies #either inverse_of: :parent_comment or foreign_key: :parent_comment_id, class: "Comment"
  # belongs_to :parent_comment #implies there is a parent_comment_id
  belongs_to :post
  belongs_to :parent_comment, class_name: 'Comment'
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_comment_id'

  validates_presence_of :commenter, :message

  scope :parent_comments, where(:parent_comment_id => nil)

  def is_reply?
    parent_comment.present?
  end

  def type
    is_reply? ? "reply" : "comment"
  end

end
