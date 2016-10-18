class TopicIndicator < ActiveRecord::Base
  belongs_to :topic
  belongs_to :indicator
end
