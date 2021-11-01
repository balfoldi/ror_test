module Api
  class LikeSerializer < Api::BaseSerializer

    attributes :id
    attributes :liked_type
    belongs_to :user
    belongs_to :liked

  end
end
