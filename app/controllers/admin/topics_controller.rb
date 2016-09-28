class Admin::TopicsController < Admin::BaseController
  before_action :require_login

  def index
    @topics = Topic.all.sort_by { |topic| topic.updated_at }.reverse!
  end

  def new
    @topic = Topic.new
    @visuals = @topic.visuals.build
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      @topic.update(display_name: SecureRandom.hex(5))
      create_tags
      redirect_to admin_topic_path(@topic)
    else
      flash[:error] = @topic.errors.full_messages.first
      render :action => 'new'
    end
  end

  def show
    @topic = Topic.find_by(display_name: params[:display_name])
    @visuals = @topic.visuals.sort
    @related_countries = @topic.tags.sample.countries.last(3)
    @related_indicators = @topic.tags.sample.indicators.last(3)
    @related_topics = @topic.tags.sample.topics.reject{ |topic| topic.title == @topic.title }.sort_by(&:updated_at).last(2).reverse!
  end

  def edit
    @topic = Topic.find_by(display_name: params[:display_name])
    @visuals = @topic.visuals.sort
  end

  def update
    @topic = Topic.find_by(display_name: params[:display_name])
    if @topic.update(topic_params)
      update_tags
      flash[:success] = "Topic was updated successfully!"
      redirect_to admin_topic_path(@topic)
    else
      flash[:error] = @user.errors.full_messages.first
      redirect_to edit_admin_topic_path(@topic)
    end
  end

  def destroy
    topic = Topic.find_by(display_name: params[:display_name])
    topic.tags.clear
    topic.visuals.clear
    topic.destroy
    flash[:success] = "Topic deleted!"
    redirect_to admin_topics_path
  end

private
  def create_tags
    tags = params[:topic][:tags]
    tags.each do |tag_id|
      if tag_id != ""
        @topic.tags << Tag.find_by(id: tag_id)
      end
    end
  end

  def update_tags
    @topic.tags.clear
    tags = params[:topic][:tags]
    tags.each do |tag_id|
      if tag_id != ""
        @topic.tags << Tag.find_by(id: tag_id)
      end
    end
  end

  def topic_params
    params.require(:topic).permit(:title, :report_date, :intro, :conclusion, { visuals_attributes: [:id, :link, :caption, :description]})
  end
end
