class ApplicationController < ActionController::Base
  # For APIs, you may want to use :null_session instead.
  layout false
  protect_from_forgery with: :exception
  
  include ActiveSession
    helper_method :current_user

end
