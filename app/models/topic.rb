class Topic < ActiveRecord::Base
  has_many :topic_tags, dependent: :delete_all
  has_many :tags, through: :topic_tags

  validates_presence_of :title
  validates_presence_of :body

  def to_param
    title.split(" ").join("-")
  end
end
