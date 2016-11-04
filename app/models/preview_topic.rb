class PreviewTopic < ActiveRecord::Base
  belongs_to :preview
  belongs_to :topic
end
