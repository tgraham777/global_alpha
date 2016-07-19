class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You logged in successfully!"
      if current_admin?
        redirect_to admin_topics_path
      else
        redirect_to topics_path
      end
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
