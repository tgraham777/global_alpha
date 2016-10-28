class Visual < ActiveRecord::Base
  has_many :topic_visuals, dependent: :delete_all
  has_many :topics, through: :topic_visuals
  has_many :country_visuals, dependent: :delete_all
  has_many :countries, through: :country_visuals
  has_many :indicator_visuals, dependent: :delete_all
  has_many :indicators, through: :indicator_visuals

  validates_presence_of :link

  def to_param
    display_name
  end

  def find_visual_source_name
    if self.countries.any?
      self.countries.first.name
    elsif self.topics.any?
      self.topics.first.title
    elsif self.indicators.any?
      self.indicators.first.name
    end
  end

  def find_visual_source_type
    if self.countries.any?
      "Country"
    elsif self.topics.any?
      "Topic"
    elsif self.indicators.any?
      "Indicator"
    end
  end

  def find_visual_source_route
    if self.countries.any?
      "/countries/" + self.countries.first.display_name
    elsif self.topics.any?
      "/topics/" + self.topics.first.display_name
    elsif self.indicators.any?
      "/indicators/" + self.indicators.first.display_name
    end
  end

  def find_admin_visual_source_route
    if self.countries.any?
      "/admin/countries/" + self.countries.first.display_name
    elsif self.topics.any?
      "/admin/topics/" + self.topics.first.display_name
    elsif self.indicators.any?
      "/admin/indicators/" + self.indicators.first.display_name
    end
  end
end
