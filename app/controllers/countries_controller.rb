class CountriesController < ApplicationController
  before_action :require_login

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find_by(display_name: params[:display_name])
    @visuals = @country.visuals.sort
    @related_indicators = @country.indicators
    @related_topics = @country.topics.sort_by(&:updated_at).last(2).reverse!
  end
end
