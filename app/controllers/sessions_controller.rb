class SessionsController < ApplicationController

  def destroy
  	session[:user] = nil
  	redirect_to root_url
  end

end