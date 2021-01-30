class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    user = User.find_by(mail: session_params[:mail])

    if user&.authenticate(session_params[:password])
      session[:user_id]=user.id
      flash[:notice] ="ログインしました"
      redirect_to '/users/show'
    else
      render 'new'
    end
  end

  def destroy
    reset_session
    flash[:notice] = "ログアウトしました"
    redirect_to '/' 
  end

  private
  def session_params
    params.require(:session).permit(:mail,:password)
  end
end
