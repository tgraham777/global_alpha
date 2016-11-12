class Admin::PreviewsController < Admin::BaseController
  before_action :require_login, except: [:show, :index]

  def index
    @previews = Preview.all.sort_by(&:updated_at).reverse!
  end

  def show
    @preview = Preview.find_by(display_name: params[:display_name])
    @visuals = @preview.visuals.sort
    @related_topics = @preview.topics.sort_by(&:updated_at).last(2).reverse!
    @related_countries = @preview.countries
    @related_indicators = @preview.indicators
  end

  def new
    @preview = Preview.new
    @visuals = @preview.visuals.build
  end

  def create
    @preview = Preview.new(preview_params)
    if @preview.save
      @preview.update(display_name: SecureRandom.hex(5))
      create_preview_topics
      create_preview_countries
      create_preview_indicators
      create_preview_tags
      create_visual_display_names
      redirect_to admin_preview_path(@preview)
    else
      flash[:error] = @preview.errors.full_messages.first
      render :action => 'new'
    end
  end

  def edit
    @preview = Preview.find_by(display_name: params[:display_name])
    @visuals = @preview.visuals.sort
  end

  def update
    @preview = Preview.find_by(display_name: params[:display_name])
    if @preview.update(preview_params)
      update_preview_topics
      update_preview_countries
      update_preview_indicators
      update_preview_tags
      update_visual_display_names
      flash[:success] = "Preview was updated successfully!"
      redirect_to admin_preview_path(@preview)
    else
      flash[:error] = @preview.errors.full_messages.first
      redirect_to edit_admin_preview_path(@preview)
    end
  end

  def destroy
    preview = Preview.find_by(display_name: params[:display_name])
    preview.topics.clear
    preview.countries.clear
    preview.indicators.clear
    preview.visuals.each { |visual| visual.destroy }
    preview.tags.clear
    preview.destroy
    flash[:success] = "Preview deleted!"
    redirect_to admin_previews_path
  end

private
  def preview_params
    params.require(:preview).permit(:title, :report_date, :tagline, :intro, :conclusion, { visuals_attributes: [:id, :title, :link, :caption, :description]})
  end

  def create_preview_topics
    topics = params[:preview][:topics]
    topics.each do |topic_id|
      if topic_id != ""
        @preview.topics << Topic.find_by(id: topic_id)
      end
    end
  end

  def create_preview_countries
    countries = params[:preview][:countries]
    countries.each do |country_id|
      if country_id != ""
        @preview.countries << Country.find_by(id: country_id)
      end
    end
  end

  def create_preview_indicators
    indicators = params[:preview][:indicators]
    indicators.each do |indicator_id|
      if indicator_id != ""
        @preview.indicators << Indicator.find_by(id: indicator_id)
      end
    end
  end

  def create_preview_tags
    tags = params[:preview][:tags]
    tags.each do |tag_id|
      if tag_id != ""
        @preview.tags << Tag.find_by(id: tag_id)
      end
    end
  end

  def create_visual_display_names
    @preview.visuals.each do |visual|
      visual.update(display_name: SecureRandom.hex(5))
    end
  end

  def update_preview_topics
    @preview.topics.clear
    topics = params[:preview][:topics]
    topics.each do |topic_id|
      if topic_id != ""
        @preview.topics << Topic.find_by(id: topic_id)
      end
    end
  end

  def update_preview_countries
    @preview.countries.clear
    countries = params[:preview][:countries]
    countries.each do |country_id|
      if country_id != ""
        @preview.countries << Country.find_by(id: country_id)
      end
    end
  end

  def update_preview_indicators
    @preview.indicators.clear
    indicators = params[:preview][:indicators]
    indicators.each do |indicator_id|
      if indicator_id != ""
        @preview.indicators << Indicator.find_by(id: indicator_id)
      end
    end
  end

  def update_preview_tags
    @preview.tags.clear
    tags = params[:preview][:tags]
    tags.each do |tag_id|
      if tag_id != ""
        @preview.tags << Tag.find_by(id: tag_id)
      end
    end
  end

  def update_visual_display_names
    @preview.visuals.each do |visual|
      if visual.display_name == nil
        visual.update(display_name: SecureRandom.hex(5))
      end
    end
  end
end
