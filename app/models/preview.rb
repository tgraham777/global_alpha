class Preview < ActiveRecord::Base
  has_many :preview_tags, dependent: :delete_all
  has_many :tags, through: :preview_tags
  has_many :preview_visuals, dependent: :delete_all
  has_many :visuals, through: :preview_visuals
  has_many :preview_topics, dependent: :delete_all
  has_many :topics, through: :preview_topics
  has_many :preview_countries, dependent: :delete_all
  has_many :countries, through: :preview_countries
  has_many :preview_indicators, dependent: :delete_all
  has_many :indicators, through: :preview_indicators

  accepts_nested_attributes_for :visuals

  validates :title, presence: true, uniqueness: true
  validates_presence_of :report_date

  def to_param
    display_name
  end
end
