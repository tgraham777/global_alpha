class Tag < ActiveRecord::Base
  has_many :topic_tags
  has_many :topics, through: :topic_tags

  validates_presence_of :name
end
