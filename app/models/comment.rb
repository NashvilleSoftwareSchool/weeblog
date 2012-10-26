class Comment < ActiveRecord::Base
  attr_accessible :commenter, :message

  validates_presence_of :commenter, :message

  belongs_to :post
end
