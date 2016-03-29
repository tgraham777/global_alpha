class DashboardController < ApplicationController
  def index
    if !current_user
      flash[:error] = "You need to log in first!"
      redirect_to login_path
    end
  end
end
