module ActiveSession

  def current_user
    @current_user ||= User.find(session[:user]) if session[:user]
  end

end