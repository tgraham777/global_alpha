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
      create_country_tags
      create_visual_display_names
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
    @visuals = @country.visuals.sort
    @related_indicators = @country.indicators
    @related_topics = @country.topics.sort_by(&:updated_at).last(2).reverse!
  end

  def edit
    @country = Country.find_by(display_name: params[:display_name])
    @visuals = @country.visuals.sort
  end

  def update
    @country = Country.find_by(display_name: params[:display_name])
    if @country.update(country_params)
      update_country_indicators
      update_country_tags
      update_visual_display_names
      flash[:success] = "Country was updated successfully!"
      redirect_to admin_country_path(@country)
    else
      flash[:error] = @country.errors.full_messages.first
      redirect_to edit_admin_country_path(@country)
    end
  end

  def destroy
    country = Country.find_by(display_name: params[:display_name])
    country.topics.clear
    country.indicators.clear
    country.visuals.clear
    country.tags.clear
    country.destroy
    flash[:success] = "Country deleted!"
    redirect_to admin_countries_path
  end

private
  def country_params
    params.require(:country).permit(:name, :last_updated, :intro, :conclusion, { visuals_attributes: [:id, :title, :link, :caption, :description]})
  end

  def create_country_tags
    tags = params[:country][:tags]
    tags.each do |tag_id|
      if tag_id != ""
        @country.tags << Tag.find_by(id: tag_id)
      end
    end
  end

  def create_visual_display_names
    @country.visuals.each do |visual|
      visual.update(display_name: SecureRandom.hex(5))
    end
  end

  def update_country_indicators
    @country.indicators.clear
    indicators = params[:country][:indicators]
    indicators.each do |indicator_id|
      if indicator_id != ""
        @country.indicators << Indicator.find_by(id: indicator_id)
      end
    end
  end

  def update_country_tags
    @country.tags.clear
    tags = params[:country][:tags]
    tags.each do |tag_id|
      if tag_id != ""
        @country.tags << Tag.find_by(id: tag_id)
      end
    end
  end

  def update_visual_display_names
    @country.visuals.each do |visual|
      if visual.display_name == nil
        visual.update(display_name: SecureRandom.hex(5))
      end
    end
  end
end
