class Tag < ActiveRecord::Base
  has_many :topic_tags, dependent: :delete_all
  has_many :topics, through: :topic_tags

  has_many :indicator_tags, dependent: :delete_all
  has_many :indicators, through: :indicator_tags

  has_many :country_tags, dependent: :delete_all
  has_many :countries, through: :country_tags

  has_many :preview_tags, dependent: :delete_all
  has_many :previews, through: :preview_tags

  validates :name, presence: true, uniqueness: true
end
