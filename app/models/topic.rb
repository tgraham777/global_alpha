class Topic < ActiveRecord::Base
  has_many :topic_tags
  has_many :tags, through: :topic_tags

  validates_presence_of :title
  validates_presence_of :body

  def to_param
    title
  end
end
