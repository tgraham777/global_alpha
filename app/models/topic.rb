class Topic < ActiveRecord::Base
  has_many :topic_tags
  has_many :tags, through: :topic_tags
  has_many :topic_visuals
  has_many :visuals, through: :topic_visuals

  accepts_nested_attributes_for :visuals

  validates_presence_of :title
  validates_uniqueness_of :title
  validates_presence_of :report_date

  def to_param
    display_name
  end
end
