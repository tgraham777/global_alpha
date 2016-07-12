class Admin::TopicsController < Admin::BaseController
  before_action :require_login

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    create_visual_count

    @topic = Topic.new(title: params[:title], intro: params[:intro], conclusion: params[:conclusion], report_date: params[:report_date], visual_count: @visual_count, display_name: SecureRandom.hex(10))
    if @topic.save
      create_tags
      create_visuals
      create_descriptions
      redirect_to admin_topic_path(@topic)
    else
      flash[:error] = @topic.errors.full_messages.first
      render :action => 'new'
    end
  end

  def show
    @topic = Topic.find_by(display_name: params[:display_name])
  end

  def destroy
    topic_name = params[:title].split("-").join(" ")
    topic = Topic.find_by(title: topic_name)
    topic.tags.clear
    topic.visuals.clear
    topic.descriptions.clear
    topic.destroy
    flash[:success] = "Topic deleted!"
    redirect_to admin_topics_path
  end

private
  def create_visual_count
    if params[:visual_link_1] = ""
      @visual_count = 0
    else
      @visual_count = (params.count-10)/3
    end
  end

  def create_tags
    tags = params[:topic][:tags]
    tags.each do |tag_name|
      if tag_name != ""
        @topic.tags << Tag.find_by(name: tag_name)
      end
    end
  end

  def create_visuals
    if @visual_count > 0
      i = 11
      while i < params.flatten.count - 14 do
        visual = Visual.new(link: params.flatten[i], caption: params.flatten[i+2])
        @topic.visuals << visual
        i += 6
      end
    end
  end

  def create_descriptions
    i = 15
    while i < params.flatten.count - 10 do
      description = Description.new(body: params.flatten[i])
      @topic.descriptions << description
      i += 6
    end
  end
end
