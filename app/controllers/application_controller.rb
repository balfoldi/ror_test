class ApplicationController < ActionController::API
 serialization_scope :current_user

  def require_current_user
    if current_user
      return
    end

    render json: { error: 'you must be logged in' }, status: :unauthorized
  end

  # To simplify the test, I'm using the first user in database
  def current_user
    User.first
  end
end
