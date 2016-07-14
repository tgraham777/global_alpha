class Visual < ActiveRecord::Base
  has_many :topic_visuals, dependent: :delete_all
  has_many :topics, through: :topic_visuals
  has_one :description

  accepts_nested_attributes_for :description

  validates_presence_of :link
end
