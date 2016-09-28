class CountriesController < ApplicationController
  before_action :require_login

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find_by(display_name: params[:display_name])
    @related_topics = @country.tags.sample.topics.last(2).reverse!
    @related_indicators = @country.tags.sample.indicators
  end
end
