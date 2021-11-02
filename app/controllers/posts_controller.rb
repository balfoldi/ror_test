class PostsController < ApplicationController
  def index
    posts = Post.all
    render build_objects(posts)
  end
end
