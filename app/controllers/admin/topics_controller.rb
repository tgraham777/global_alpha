class Admin::TopicsController < Admin::BaseController
  before_action :require_login

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    params[:title].downcase!
    visual_count = (params.count-10)/3
    @topic = Topic.new(title: params[:title], intro: params[:intro], conclusion: params[:conclusion], report_date: params[:report_date], visual_count: visual_count)
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
    topic_name = params[:title].split("-").join(" ")
    @topic = Topic.find_by(title: topic_name)
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
  def create_tags
    tags = params[:topic][:tags]
    tags.each do |tag_name|
      if tag_name != ""
        @topic.tags << Tag.find_by(name: tag_name)
      end
    end
  end

  def create_visuals
    i = 11
    while i < params.flatten.count - 14 do
      visual = Visual.new(link: params.flatten[i], caption: params.flatten[i+2])
      if visual.save
        @topic.visuals << visual
      else
        flash[:error] = visual.errors.full_messages.first
        render :action => 'new'
      end
      i += 6
    end
  end

  def create_descriptions
    i = 15
    while i < params.flatten.count - 10 do
      description = Description.new(body: params.flatten[i])
      if description.save
        @topic.descriptions << description
      else
        flash[:error] = description.errors.full_messages.first
        render :action => 'new'
      end
      i += 6
    end
  end
end
