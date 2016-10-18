class TopicCountry < ActiveRecord::Base
  belongs_to :topic
  belongs_to :country
end
