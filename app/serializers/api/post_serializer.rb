module Api
  class PostSerializer < Api::BaseSerializer

    attributes :id
    attributes :description
    has_many :likes
    belongs_to :user

  end
end
