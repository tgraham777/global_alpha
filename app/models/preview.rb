class Preview < ActiveRecord::Base
  has_many :preview_tags, dependent: :delete_all
  has_many :tags, through: :preview_tags
  has_many :preview_visuals, dependent: :delete_all
  has_many :visuals, through: :preview_visuals
  has_many :preview_topics, dependent: :delete_all
  has_many :topics, through: :preview_topics

  validates :title, presence: true, uniqueness: true
  validates_presence_of :report_date

  def to_param
    display_name
  end
end
