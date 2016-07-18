class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(display_name: params[:session][:display_name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You logged in successfully!"
      redirect_to dashboard_path
    else
      flash[:error] = "Invalid login!"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:success] = "You logged out successfully!"
    redirect_to root_path
  end
end
