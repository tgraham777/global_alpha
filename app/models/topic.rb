class Topic < ActiveRecord::Base
  has_many :descriptions
  has_many :topic_tags, dependent: :delete_all
  has_many :tags, through: :topic_tags
  has_many :topic_visuals, dependent: :delete_all
  has_many :visuals, through: :topic_visuals

  validates_presence_of :title
  validates_presence_of :intro
  validates_presence_of :conclusion
  validates_presence_of :report_date

  def to_param
    title.split(" ").join("-")
  end
end
