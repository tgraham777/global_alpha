class TopicsController < ApplicationController
  before_action :require_login

  def index
    @topics = Topic.all.sort_by(&:updated_at).reverse!
  end

  def show
    @topic = Topic.find_by(display_name: params[:display_name])
    @visuals = @topic.visuals.sort
    @related_countries = @topic.countries
    @related_indicators = @topic.indicators
    @related_topics = @topic.tags.sample.topics.reject{ |topic| topic.title == @topic.title }.sort_by(&:updated_at).last(2).reverse!
  end
end
