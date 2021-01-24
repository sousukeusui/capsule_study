class HomeController < ApplicationController
  def index
  end

  def new
    @user =User.new
  end

  def login
    @user =User.new
  end
end
