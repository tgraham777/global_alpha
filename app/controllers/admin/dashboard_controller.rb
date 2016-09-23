class Admin::DashboardController < Admin::BaseController
  before_action :require_login

  def index
    @related_topics = Topic.all.last(4)
    @related_countries = Country.all.last(4)
    @related_indicators = Indicator.all.last(4)
  end
end
