class ApplicationController < ActionController::Base
  # For APIs, you may want to use :null_session instead.
  layout false
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user]) if session[:user]
  end

end
