class PostsController < ActionController::API
  def index
    posts = Post.all
    render json: posts, each_serializer: Api::PostSerializer
  end
end
