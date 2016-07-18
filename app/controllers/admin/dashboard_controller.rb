class Admin::DashboardController < Admin::BaseController
  before_action :require_login

  def index
    @user = User.all.first
  end
end
