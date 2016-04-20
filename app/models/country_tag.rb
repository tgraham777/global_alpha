class CountryTag < ActiveRecord::Base
  belongs_to :country
  belongs_to :tag
end
