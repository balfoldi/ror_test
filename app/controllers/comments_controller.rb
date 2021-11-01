class CommentsController < ApplicationController
  before_action :set_post

  def index
    @comments = Comment.where(post: @post)
    render json: @comments, each_serializer: Api::CommentSerializer
  end

  def create
    @comment = @post.comments.create(comment_params.merge(user: current_user))
    render json: @comment, serializer: Api::CommentSerializer
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
