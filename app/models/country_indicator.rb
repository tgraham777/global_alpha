class CountryIndicator < ActiveRecord::Base
  belongs_to :country
  belongs_to :indicator
end
