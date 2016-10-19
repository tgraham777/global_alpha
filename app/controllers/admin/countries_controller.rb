class Admin::CountriesController < Admin::BaseController
  before_action :require_login

  def new
    @country = Country.new
    @visuals = @country.visuals.build
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      @country.update(display_name: SecureRandom.hex(5))
      create_country_indicators
      create_country_tags
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
    @related_topics = @country.tags.sample.topics.last(2).reverse!
    @related_indicators = @country.tags.sample.indicators
  end

  def destroy
    country = Country.find_by(display_name: params[:display_name])
    country.topics.clear
    country.tags.clear
    country.destroy
    flash[:success] = "Country deleted!"
    redirect_to admin_countries_path
  end

private
  def country_params
    params.require(:country).permit(:name, :last_updated, :intro, :conclusion, { visuals_attributes: [:id, :link, :caption, :description]})
  end

  def create_country_indicators
    indicators = params[:country][:indicators]
    indicators.each do |indicator_id|
      if indicator_id != ""
        @country.indicators << Indicator.find_by(id: indicator_id)
      end
    end
  end

  def create_country_tags
    tags = params[:country][:tags]
    tags.each do |tag_id|
      if tag_id != ""
        @country.tags << Tag.find_by(id: tag_id)
      end
    end
  end
end
