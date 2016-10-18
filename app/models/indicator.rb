class Indicator < ActiveRecord::Base
  has_many :indicator_tags
  has_many :tags, through: :indicator_tags
  has_many :topic_indicators
  has_many :topics, through: :topic_indicators

  validates :name, presence: true, uniqueness: true

  def to_param
    display_name
  end
end
