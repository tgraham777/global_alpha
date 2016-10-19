class Country < ActiveRecord::Base
  has_many :country_tags
  has_many :tags, through: :country_tags
  has_many :topic_countries
  has_many :topics, through: :topic_countries
  has_many :country_visuals
  has_many :visuals, through: :country_visuals

  validates :name, presence: true, uniqueness: true
  validates_presence_of :last_updated

  def to_param
    display_name
  end
end
