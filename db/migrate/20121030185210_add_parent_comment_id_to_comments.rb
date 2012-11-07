class AddParentCommentIdToComments < ActiveRecord::Migration

  scope :reply, where(:reply => true).joins(:comment)
  Comment.reply # => [reply comments]

  def change
    add_column :comments, :parent_comment_id, :integer
  end
end
