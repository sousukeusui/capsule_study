class SessionsController < ApplicationController
  skip_before_action :login_required
  

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

        #5時超え、かつ最終ログインから日付が１日経っている、かつcountが０
        if now_time.hour >= 5 && now_time.yday - last_time.yday == 1  && @user.count == 0 
          @user.update(point: new_point,count: 0)
          flash[:notice]="ログインボーナス獲得"

        #5時は超えていない、かつ最終ログインから2日経っている、かつcountが０
        elsif now_time.hour < 5 && now_time.yday - last_time.yday >= 2 && @user.count == 0
          @user.update(point: new_point,count: 1)
          flash[:notice]="ログインボーナス獲得"

        #5時超え、かつcountが1
        elsif now_time.hour >= 5 && @user.count == 1
          @user.update(point: new_point,count: 0)
          flash[:notice]="ログインボーナス獲得"
        end

        @user.update(logged_in: now_time)
        flash[:notice] ="ログインしました"
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
