class Indicator < ActiveRecord::Base
  has_many :indicator_tags, dependent: :delete_all
  has_many :tags, through: :indicator_tags
  has_many :indicator_visuals, dependent: :delete_all
  has_many :visuals, through: :indicator_visuals
  has_many :topic_indicators, dependent: :delete_all
  has_many :topics, through: :topic_indicators
  has_many :country_indicators, dependent: :delete_all
  has_many :countries, through: :country_indicators

  accepts_nested_attributes_for :visuals

  validates :name, presence: true
  validates_presence_of :last_updated

  def to_param
    display_name
  end
end
