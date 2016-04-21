class CountriesController < ApplicationController
  before_action :require_login

  def new
    @country = Country.new
  end

  def create
    params[:name].downcase!
    @country = Country.new(name: params[:name])

    if @country.save
      tags = params[:country][:tags]
      tags.each do |tag_name|
        if tag_name != ""
          @country.tags << Tag.find_by(name: tag_name)
        end
      end

      redirect_to @country
    else
      flash[:error] = @country.errors.full_messages.first
      render :action => 'new'
    end
  end

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find_by(name: params[:name])
  end

  def destroy
    country = Country.find_by(name: params[:name])
    country.tags.clear
    country.destroy
    flash[:success] = "Country deleted!"
    redirect_to countries_path
  end
end
