class TopicsController < ApplicationController
  before_action :require_login

  def index
    @topics = Topic.all.sort_by { |topic| topic.updated_at }.reverse!
  end

  def show
    @topic = Topic.find_by(display_name: params[:display_name])
    @visuals = @topic.visuals.sort
  end
end
