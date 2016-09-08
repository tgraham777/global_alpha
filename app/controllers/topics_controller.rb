class TopicsController < ApplicationController
  before_action :require_login

  def index
    @topics = Topic.all.sort_by { |topic| topic.updated_at }.reverse!
  end

  def show
    @topic = Topic.find_by(display_name: params[:display_name])
    @visuals = @topic.visuals.sort
    @related_countries = 3.times.map { @topic.tags.sample.countries.sample }.uniq
    @related_indicators = 3.times.map { @topic.tags.sample.indicators.sample }.uniq
    @related_topics = 3.times.map { @topic.tags.sample.topics.sample }.uniq.reject{ |topic| topic.title == @topic.title }
  end
end
