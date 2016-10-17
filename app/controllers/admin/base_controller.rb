class Admin::BaseController < ApplicationController
  before_action :require_admin

private
  def require_admin
    unless current_admin?
      flash[:error] = "You must be logged in as an administrator to access this section."
      redirect_to '/login'
    end
  end
end
