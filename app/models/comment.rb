class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :likes, as: :liked
  validates :content, presence: true
end
