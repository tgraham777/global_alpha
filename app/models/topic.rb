class Topic < ActiveRecord::Base
  has_many :topic_tags
  has_many :tags, through: :topic_tags
end
