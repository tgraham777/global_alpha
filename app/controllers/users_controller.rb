class UsersController < ApplicationController
  def show
    if current_user
      @user = User.find_by(display_name: params[:display_name])
    else
      flash[:error] = "You need to log in or create an account first!"
      redirect_to login_path
    end
  end
end
