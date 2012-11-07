class Post < ActiveRecord::Base
  attr_accessible :body, :title, :publish_date

  validates_presence_of :title, :body, :author, :publish_date

  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :parent_comments, class_name: "Comment", conditions: { parent_comment_id: nil }

  scope :published, lambda { where("publish_date < ?", Time.zone.now ) }

  def published?
    publish_date < Time.zone.now
  end

end
