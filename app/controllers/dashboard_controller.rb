class DashboardController < ApplicationController
  before_action :require_login
  
  def index
    if !current_user
      flash[:error] = "You need to log in or create an account first!"
      redirect_to login_path
    end
  end
end
