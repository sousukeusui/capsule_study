class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new user_params
    if @user.save then
      redirect_to '/users/show'
    else
      render template: "home/new"
    end
  end

  def login
  end

  private
  def user_params
    params.require(:user).permit(:mail, :name, :password)
  end
end
