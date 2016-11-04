class PreviewIndicator < ActiveRecord::Base
  belongs_to :preview
  belongs_to :indicator
end
