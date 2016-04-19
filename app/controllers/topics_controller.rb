class TopicsController < ApplicationController
  before_action :require_login

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
    @tags = Tag.all
  end

  def create
    @topic = Topic.new(title: params[:title], body: params[:body])
    if @topic.save
      tags = params[:tags].split(", ")
      tags.each do |tag_name|
        @topic.tags << Tag.find_or_create_by(name: tag_name)
      end

      redirect_to @topic
    else
      flash[:error] = @topic.errors.full_messages.first
      render :action => 'new'
    end
  end

  def show
    @topic = Topic.find_by(title: params[:title])
  end

  def destroy
    topic = Topic.find_by(title: params[:title])
    topic.tags.clear
    topic.destroy
    flash[:success] = "Topic deleted!"
    redirect_to topics_path
  end
end
