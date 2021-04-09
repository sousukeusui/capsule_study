class HomeController < ApplicationController
  skip_before_action :login_required
  before_action :current_user_redirect

  def index
  end

  def new
    @user =User.new
  end

  def login
    @user =User.new
  end
end
