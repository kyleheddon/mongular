class ApplicationController < ActionController::Base
  include ActiveSession::CurrentUser
  # For APIs, you may want to use :null_session instead.
  layout false
  protect_from_forgery with: :exception
  helper_method :current_user
end