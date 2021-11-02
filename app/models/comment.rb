class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :likes, as: :liked
  MINIMUM_CONTENT_LENGTH = 3
  MAXIMUM_CONTENT_LENGTH = 50
  validates :content, presence: true, length: { in: MINIMUM_CONTENT_LENGTH..MAXIMUM_CONTENT_LENGTH }

  def update_likes_count
    self.update(likes_count: self.likes.size)
  end
end
