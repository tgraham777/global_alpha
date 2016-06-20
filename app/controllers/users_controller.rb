class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    params[:user][:username].downcase!
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages.first
      render :action => 'new'
    end
  end

  def show
    if current_user
      user_name = params[:username].split("-").join(" ")
      @user = User.find_by(username: user_name)
    else
      flash[:error] = "You need to log in or create an account first!"
      redirect_to login_path
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :role)
  end
end
