class LikesController < ApplicationController
  before_action :set_liked

  def create
    @like = @liked.likes.create(user: current_user, liked: @liked)
    render build_object_error_managed(@like)
  end

  private

  def set_liked
    @liked = params[:liked_type].constantize.find_by(id: params[:liked_id])
    render json: { error: 'you must supply a valid liked object id' }, status: :bad_request unless @liked && @liked.respond_to?(:likes)
  end
end
