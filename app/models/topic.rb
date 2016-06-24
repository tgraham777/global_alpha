class Topic < ActiveRecord::Base
  has_many :descriptions, dependent: :delete_all
  has_many :topic_tags, dependent: :delete_all
  has_many :tags, through: :topic_tags
  has_many :topic_visuals, dependent: :delete_all
  has_many :visuals, through: :topic_visuals

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :report_date
  validates_presence_of :visual_count

  def to_param
    title.split(" ").join("-")
  end
end
