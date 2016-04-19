class IndicatorTag < ActiveRecord::Base
  belongs_to :indicator
  belongs_to :tag
end
