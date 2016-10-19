class Country < ActiveRecord::Base
  has_many :country_tags, dependent: :delete_all
  has_many :tags, through: :country_tags
  has_many :topic_countries, dependent: :delete_all
  has_many :topics, through: :topic_countries
  has_many :country_visuals, dependent: :delete_all
  has_many :visuals, through: :country_visuals
  has_many :country_indicators, dependent: :delete_all
  has_many :indicators, through: :country_indicators

  accepts_nested_attributes_for :visuals

  validates :name, presence: true, uniqueness: true
  validates_presence_of :last_updated

  def to_param
    display_name
  end
end
