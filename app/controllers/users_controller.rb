class UsersController < ApplicationController
  before_action :login_required, only:[:show,:edit]

  def create
    @user = User.new user_params
    if @user.save then
      session[:user_id]=@user.id
      now_time = Time.now
      @user.update(logged_in: now_time,point: 500)
      flash[:notice] = "登録しました"
      redirect_to controller: 'users', action: 'show', id:session[:user_id]
    else
      render template: "home/new"
    end
  end

  def show
    @mydata =current_user.posts
    @users = User.where(id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) 
    if @user.update profile_params
      flash[:notice] = "更新しました"
      redirect_to "/users/show/" + @user.id.to_s
    else
      render "edit"
    end
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "退会しました"
    redirect_to '/'
  end


  private
  def user_params
    params.require(:user).permit(:mail, :name, :password, :image)
  end

  def profile_params
    params.require(:user).permit(:name, :image, :profile)
  end
end
