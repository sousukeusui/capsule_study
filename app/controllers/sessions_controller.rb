class SessionsController < ApplicationController
  require 'time'
  require 'active_support/time'
  skip_before_action :login_required
  before_action :current_user_redirect, only:["new"]

  def new
    @user = User.new
  end

  def create
      @user = User.find_by(mail: session_params[:mail])
      if @user&.authenticate(session_params[:password])
        session[:user_id]=@user.id
        now_time = Time.now
        last_time = @user.logged_in
        new_point = @user.point + 100
        bonus = ""
        
        #カウントをリセット
        if last_time.day == now_time.yesterday.day && now_time.hour>=5
          @user.update(count: 0)
        elsif last_time.day == now_time.yesterday.day && last_time.hour <5 && now_time.hour <5
          @user.update(count: 0)
        elsif last_time.day == now_time.day && last_time.hour <5 && now_time.hour >=5
          @user.update(count: 0)
        elsif last_time < now_time.days_ago(2)
          @user.update(count: 0)
        end

        #ログインボーナス条件
        if @user.count==0
          @user.update(point: new_point,count: 1)
          p bonus = ":ログインボーナス獲得!"
        end

        @user.update(logged_in: now_time)
        flash[:notice] ="ログインしました#{bonus}"
        redirect_to controller: 'users', action: 'show', id:session[:user_id]

      else
        flash[:notice] = "メールアドレス、パスワードが違います"
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
