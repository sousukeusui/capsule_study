class UsersController < ApplicationController
  before_action :login_required, only:[:show,:edit]

  def create
    @user = User.new user_params
    if @user.valid?(:step1) && @user.save then
      session[:user_id]=@user.id
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

  # ここをいじる
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


  private
  def user_params
    params.require(:user).permit(:mail, :name, :password)
  end

  def profile_params
    params.require(:user).permit(:name, :image, :profile)
  end
end
