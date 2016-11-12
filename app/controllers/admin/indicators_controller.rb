class Admin::IndicatorsController < Admin::BaseController
  before_action :require_login

  def new
    @indicator = Indicator.new
    @visuals = @indicator.visuals.build
  end

  def create
    @indicator = Indicator.new(indicator_params)
    if @indicator.save
      @indicator.update(display_name: SecureRandom.hex(5))
      create_country_indicators
      create_indicator_tags
      create_visual_display_names
      redirect_to admin_indicator_path(@indicator)
    else
      flash[:error] = @indicator.errors.full_messages.first
      render :action => 'new'
    end
  end

  def index
    @countries = Country.all.sort_by(&:name)
    @indicators = Indicator.all
  end

  def show
    @indicator = Indicator.find_by(display_name: params[:display_name])
    @visuals = @indicator.visuals.sort
    @related_topics = @indicator.topics.sort_by(&:updated_at).last(2).reverse!
  end

  def edit
    @indicator = Indicator.find_by(display_name: params[:display_name])
    @visuals = @indicator.visuals.sort
  end

  def update
    @indicator = Indicator.find_by(display_name: params[:display_name])
    if @indicator.update(indicator_params)
      update_country_indicators
      update_indicator_tags
      update_visual_display_names
      flash[:success] = "Indicator was updated successfully!"
      redirect_to admin_indicator_path(@indicator)
    else
      flash[:error] = @indicator.errors.full_messages.first
      redirect_to edit_admin_indicator_path(@indicator)
    end
  end

  def destroy
    indicator = Indicator.find_by(display_name: params[:display_name])
    indicator.topics.clear
    indicator.countries.clear
    indicator.visuals.each { |visual| visual.destroy }
    indicator.tags.clear
    indicator.destroy
    flash[:success] = "Indicator deleted!"
    redirect_to admin_indicators_path
  end

private
  def indicator_params
    params.require(:indicator).permit(:name, :last_updated, :intro, :conclusion, { visuals_attributes: [:id, :title, :link, :caption, :description]})
  end

  def create_country_indicators
    countries = params[:indicator][:countries]
    countries.each do |country_id|
      if country_id != ""
        @indicator.countries << Country.find_by(id: country_id)
      end
    end
  end

  def create_indicator_tags
    tags = params[:indicator][:tags]
    tags.each do |tag_id|
      if tag_id != ""
        @indicator.tags << Tag.find_by(id: tag_id)
      end
    end
  end

  def create_visual_display_names
    @indicator.visuals.each do |visual|
      visual.update(display_name: SecureRandom.hex(5))
    end
  end

  def update_country_indicators
    @indicator.countries.clear
    countries = params[:indicator][:countries]
    countries.each do |country_id|
      if country_id != ""
        @indicator.countries << Country.find_by(id: country_id)
      end
    end
  end

  def update_indicator_tags
    @indicator.tags.clear
    tags = params[:indicator][:tags]
    tags.each do |tag_id|
      if tag_id != ""
        @indicator.tags << Tag.find_by(id: tag_id)
      end
    end
  end

  def update_visual_display_names
    @indicator.visuals.each do |visual|
      if visual.display_name == nil
        visual.update(display_name: SecureRandom.hex(5))
      end
    end
  end
end
