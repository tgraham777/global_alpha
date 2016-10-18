class Visual < ActiveRecord::Base
  has_many :topic_visuals
  has_many :topics, through: :topic_visuals

  validates_presence_of :link
end
