class Topic < ActiveRecord::Base
  has_many :topic_tags, dependent: :delete_all
  has_many :tags, through: :topic_tags
  has_many :topic_visuals, dependent: :delete_all
  has_many :visuals, through: :topic_visuals
  has_many :topic_indicators, dependent: :delete_all
  has_many :indicators, through: :topic_indicators
  has_many :topic_countries, dependent: :delete_all
  has_many :countries, through: :topic_countries
  has_many :preview_topics, dependent: :delete_all
  has_many :previews, through: :preview_topics

  accepts_nested_attributes_for :visuals

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :report_date

  def to_param
    display_name
  end
end
