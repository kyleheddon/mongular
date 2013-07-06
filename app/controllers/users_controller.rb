class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    session[:user] = user.id
    render json: user.attributes
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end