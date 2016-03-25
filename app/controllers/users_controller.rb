class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    session[:user_id] = user.id
    redirect_to user
  end

  def show
    @user = User.find(session[:user_id])
  end

private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
