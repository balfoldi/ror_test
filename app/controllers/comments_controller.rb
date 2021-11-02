class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comments = Comment.where(post: @post)
    render build_objects(@comments)
  end

  def create
    @comment = @post.comments.create(comment_params.merge(user: current_user))
    render build_object_error_managed(@comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find_by(id: params[:post_id])
    render json: { error: 'you must supply a valid post id' }, status: :bad_request unless @post
  end
end
