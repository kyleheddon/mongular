class HomeController < ApplicationController
  def index
    if session[:user]
      @user = User.find(session[:user])
    else
      @user = User.new
    end
  end
end