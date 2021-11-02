class Like < ApplicationRecord
  belongs_to :user
  belongs_to :liked, polymorphic: true
  after_create :update_comment_likes_count, if: :comment_liked?
  after_destroy :update_comment_likes_count, if: :comment_liked?

  private

  def comment_liked?
    self.liked_type.constantize == Comment
  end

  def update_comment_likes_count
    self.liked.update_likes_count
  end
end
