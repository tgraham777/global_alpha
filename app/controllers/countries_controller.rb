class CountriesController < ApplicationController
  # before_action :require_login

  def index
    @countries = Country.all
  end

  def show
    country_name = params[:name].split("-").join(" ")
    @country = Country.find_by(name: country_name)
  end
end
