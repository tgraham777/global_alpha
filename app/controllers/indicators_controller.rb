class IndicatorsController < ApplicationController
  before_action :require_login

  def new
    @indicator = Indicator.new
  end

  def create
    params[:name].downcase!
    @indicator = Indicator.new(name: params[:name])

    if @indicator.save
      tags = params[:indicator][:tags]
      tags.each do |tag_name|
        if tag_name != ""
          @indicator.tags << Tag.find_by(name: tag_name)
        end
      end

      redirect_to @indicator
    else
      flash[:error] = @indicator.errors.full_messages.first
      render :action => 'new'
    end
  end

  def index
    @indicators = Indicator.all
  end

  def show
    indicator_name = params[:name].split("-").join(" ")
    @indicator = Indicator.find_by(name: indicator_name)
  end

  def destroy
    indicator_name = params[:name].split("-").join(" ")
    indicator = Indicator.find_by(name: indicator_name)
    indicator.tags.clear
    indicator.destroy
    flash[:success] = "Indicator deleted!"
    redirect_to indicators_path
  end
end
