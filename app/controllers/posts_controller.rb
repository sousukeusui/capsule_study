class PostsController < ApplicationController
  def index
    @data = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save then
      redirect_to '/posts'
    else
      reder 'index'
    end
  end

  def show
  end

  def edit
  end
  
  private
  def post_params
    params.require(:post).permit(:content)
  end
end
