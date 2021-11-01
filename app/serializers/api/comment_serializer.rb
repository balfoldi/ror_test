module Api
  class CommentSerializer < Api::BaseSerializer

    attributes :id
    attributes :content
    belongs_to :user
    belongs_to :post
    has_many :likes

  end
end
