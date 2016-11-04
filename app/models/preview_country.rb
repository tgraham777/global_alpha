class PreviewCountry < ActiveRecord::Base
  belongs_to :preview
  belongs_to :country
end
