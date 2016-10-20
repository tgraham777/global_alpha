class Visual < ActiveRecord::Base
  has_many :topic_visuals, dependent: :delete_all
  has_many :topics, through: :topic_visuals
  has_many :country_visuals, dependent: :delete_all
  has_many :countries, through: :country_visuals

  validates_presence_of :link
  validates_presence_of :title

  def to_param
    display_name
  end
end
