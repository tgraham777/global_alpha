class Visual < ActiveRecord::Base
  has_many :topic_visuals
  has_many :topics, through: :topic_visuals
  has_many :country_visuals
  has_many :countries, through: :country_visuals

  validates_presence_of :link
end
