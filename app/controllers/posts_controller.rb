class PostsController < ApplicationController
  def index
    @data = Post.all.order(created_at: :desc)
    @user = User.all
    @post = Post.new
  end

  def create
    @post = current_user.posts.new post_params

    if @post.save then
      flash[:notice] = "投稿が完了しました"
      redirect_to '/posts'
    else
      @data = Post.all
      render 'index'
    end
  end

  def show
  end

  def edit
    @post = Post.find(params[:id])
    if request.patch? then
      @post.update(post_params)
      redirect_to '/posts'
    end
  end

  def delete
    @data = Post.find(params[:id])
    @data.destroy
    redirect_to "/posts"
  end

  
  private
  def post_params
    params.require(:post).permit(:content)
  end
end
