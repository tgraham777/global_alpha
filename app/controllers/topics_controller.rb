class TopicsController < ApplicationController
  before_action :require_login

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(title: params[:title], body: params[:body])
    if @topic.save
      tags = params[:tags].split(", ")
      tags.each do |tag_name|
        @topic.tags.create(name: tag_name)
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
end
