class Tag < ActiveRecord::Base
  has_many :topic_tags
  has_many :topics, through: :topic_tags

  has_many :indicator_tags
  has_many :indicators, through: :indicator_tags

  has_many :country_tags
  has_many :countries, through: :country_tags

  has_many :preview_tags
  has_many :previews, through: :preview_tags

  validates :name, presence: true, uniqueness: true
end
