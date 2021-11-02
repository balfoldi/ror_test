module Api
  class CommentSerializer < Api::BaseSerializer

    attributes :id
    attributes :content
    attributes :liked
    attributes :likes_count
    belongs_to :user
    belongs_to :post

    def liked
      object.likes.where(user: scope).exists?
    end
  end
end
