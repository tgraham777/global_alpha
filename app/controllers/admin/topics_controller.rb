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
    @topic = Topic.new(body: params[:body], title: params[:title], intro: params[:intro], conclusion: params[:conclusion], report_date: params[:report_date])
    if @topic.save
      tags = params[:topic][:tags]
      tags.each do |tag_name|
        if tag_name != ""
          @topic.tags << Tag.find_by(name: tag_name)
        end
      end

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
    topic.destroy
    flash[:success] = "Topic deleted!"
    redirect_to admin_topics_path
  end
end
