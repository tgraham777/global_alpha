class IndicatorsController < ApplicationController
  before_action :require_login

  def index
    @countries = Country.all.sort_by(&:name)
    @indicators = Indicator.all
  end

  def show
    @indicator = Indicator.find_by(display_name: params[:display_name])
    @visuals = @indicator.visuals.sort
    @related_topics = @indicator.topics.sort_by(&:updated_at).last(2).reverse!
  end
end
