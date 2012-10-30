class Comment < ActiveRecord::Base
  attr_accessible :commenter, :message

  # This will require a migration to add parent_comment_id:
  # has_many :replies #either inverse_of: :parent_comment or foreign_key: :parent_comment_id, class: "Comment"
  # belongs_to :parent_comment #implies there is a parent_comment_id

  validates_presence_of :commenter, :message

  belongs_to :post
end
