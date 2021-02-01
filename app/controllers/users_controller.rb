class UsersController < ApplicationController
  skip_before_action :login_required, only:[:show,:edit]

  def create
    @user = User.new user_params
    if @user.save then
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

  def edit
    @users = User.find(params[:id])
    if request.patch? then
      @users.update profile_params
      redirect_to controller: 'users' , action: 'show', id:@users.id
    end
  end


  private
  def user_params
    params.require(:user).permit(:mail, :name, :password)
  end

  def profile_params
    params.require(:user).permit(:name,:image,:profile)
  end
end
