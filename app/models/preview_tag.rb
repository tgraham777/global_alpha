class PreviewTag < ActiveRecord::Base
  belongs_to :preview
  belongs_to :tag
end
