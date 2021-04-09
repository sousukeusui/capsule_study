class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :login_required

    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login_required
        redirect_to "/login" unless current_user
    end

    def current_user_redirect
        redirect_to "/posts" if current_user
    end

    def require_admin
        redirect_to root_path unless current_user.admin?
    end
end
