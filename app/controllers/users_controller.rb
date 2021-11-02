class UsersController < ApplicationController
  def index
    users = User.all
    render build_objects(users)
  end
end
