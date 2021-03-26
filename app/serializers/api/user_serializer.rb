module Api
  class UserSerializer < Api::BaseSerializer

    attributes :id
    attributes :last_name
    attributes :first_name
    has_many :likes

  end
end
