class Admin::CountriesController < Admin::BaseController
  before_action :require_login

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(name: params[:name])

    if @country.save
      @country.update(display_name: SecureRandom.hex(5))
      tags = params[:country][:tags]
      tags.each do |tag_name|
        if tag_name != ""
          @country.tags << Tag.find_by(name: tag_name)
        end
      end

      redirect_to admin_country_path(@country)
    else
      flash[:error] = @country.errors.full_messages.first
      render :action => 'new'
    end
  end

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find_by(display_name: params[:display_name])
    @related_topics = @country.tags.sample.topics.last(2)
    @related_indicators = @country.tags.sample.indicators
  end

  def destroy
    country = Country.find_by(display_name: params[:display_name])
    country.tags.clear
    country.destroy
    flash[:success] = "Country deleted!"
    redirect_to admin_countries_path
  end
end
