class Admin::TopicsController < Admin::BaseController
  before_action :require_login

  def index
    @topics = Topic.all.sort_by(&:updated_at).reverse!
  end

  def new
    @topic = Topic.new
    @visuals = @topic.visuals.build
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      @topic.update(display_name: SecureRandom.hex(5))
      create_topic_countries
      create_topic_indicators
      create_topic_tags
      create_visual_display_names
      redirect_to admin_topic_path(@topic)
    else
      flash[:error] = @topic.errors.full_messages.first
      render :action => 'new'
    end
  end

  def show
    @topic = Topic.find_by(display_name: params[:display_name])
    @visuals = @topic.visuals.sort
    @related_countries = @topic.countries
    @related_indicators = @topic.indicators
    @related_topics = @topic.tags.sample.topics.reject{ |topic| topic.title == @topic.title }.sort_by(&:updated_at).last(2).reverse!
  end

  def edit
    @topic = Topic.find_by(display_name: params[:display_name])
    @visuals = @topic.visuals.sort
  end

  def update
    @topic = Topic.find_by(display_name: params[:display_name])
    if @topic.update(topic_params)
      update_topic_countries
      update_topic_indicators
      update_topic_tags
      update_visual_display_names
      flash[:success] = "Topic was updated successfully!"
      redirect_to admin_topic_path(@topic)
    else
      flash[:error] = @topic.errors.full_messages.first
      redirect_to edit_admin_topic_path(@topic)
    end
  end

  def destroy
    topic = Topic.find_by(display_name: params[:display_name])
    topic.countries.clear
    topic.indicators.clear
    topic.tags.clear
    topic.visuals.clear
    topic.destroy
    flash[:success] = "Topic deleted!"
    redirect_to admin_topics_path
  end

private
  def create_topic_countries
    countries = params[:topic][:countries]
    countries.each do |country_id|
      if country_id != ""
        @topic.countries << Country.find_by(id: country_id)
      end
    end
  end

  def create_topic_indicators
    indicators = params[:topic][:indicators]
    indicators.each do |indicator_id|
      if indicator_id != ""
        @topic.indicators << Indicator.find_by(id: indicator_id)
      end
    end
  end

  def create_topic_tags
    tags = params[:topic][:tags]
    tags.each do |tag_id|
      if tag_id != ""
        @topic.tags << Tag.find_by(id: tag_id)
      end
    end
  end

  def create_visual_display_names
    @topic.visuals.each do |visual|
      visual.update(display_name: SecureRandom.hex(5))
    end
  end

  def update_topic_countries
    @topic.countries.clear
    countries = params[:topic][:countries]
    countries.each do |country_id|
      if country_id != ""
        @topic.countries << Country.find_by(id: country_id)
      end
    end
  end

  def update_topic_indicators
    @topic.indicators.clear
    indicators = params[:topic][:indicators]
    indicators.each do |indicator_id|
      if indicator_id != ""
        @topic.indicators << Indicator.find_by(id: indicator_id)
      end
    end
  end

  def update_topic_tags
    @topic.tags.clear
    tags = params[:topic][:tags]
    tags.each do |tag_id|
      if tag_id != ""
        @topic.tags << Tag.find_by(id: tag_id)
      end
    end
  end

  def update_visual_display_names
    @topic.visuals.each do |visual|
      if visual.display_name == nil
        visual.update(display_name: SecureRandom.hex(5))
      end
    end
  end

  def topic_params
    params.require(:topic).permit(:title, :report_date, :intro, :conclusion, { visuals_attributes: [:id, :title, :link, :caption, :description]})
  end
end
