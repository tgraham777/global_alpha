class TopicsController < ApplicationController
  before_action :require_login

  def index
    @topics = Topic.all
  end

  def show
    topic_name = params[:title].split("-").join(" ")
    @topic = Topic.find_by(title: topic_name)
  end
end
