class RemoveSourceCountryFromIndicator < ActiveRecord::Migration
  def change
    remove_column :indicators, :source_country, :string
  end
end
