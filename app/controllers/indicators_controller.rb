class IndicatorsController < ApplicationController
  before_action :require_login

  def index
    @indicators = Indicator.all
  end

  def show
    indicator_name = params[:name].split("-").join(" ")
    @indicator = Indicator.find_by(name: indicator_name)
  end
end
