class IndicatorsController < ApplicationController
  before_action :require_login

  def index
    @indicators = Indicator.all
  end

  def show
    @indicator = Indicator.find_by(display_name: params[:display_name])
    @related_countries = Country.all
    @related_topics = @indicator.tags.sample.topics.last(2)
  end
end
