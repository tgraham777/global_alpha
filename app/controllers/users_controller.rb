class UsersController < ApplicationController
  def show
    if current_user
      user_name = params[:username].split("-").join(" ")
      @user = User.find_by(username: user_name)
    else
      flash[:error] = "You need to log in or create an account first!"
      redirect_to login_path
    end
  end
end
