class Country < ActiveRecord::Base
  has_many :country_tags
  has_many :tags, through: :country_tags
  has_many :topic_countries
  has_many :topics, through: :topic_countries

  validates :name, presence: true, uniqueness: true

  def to_param
    display_name
  end
end
