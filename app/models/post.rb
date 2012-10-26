class Post < ActiveRecord::Base
  attr_accessible :body, :title

  validates_presence_of :title, :body

  has_many :comments
end
