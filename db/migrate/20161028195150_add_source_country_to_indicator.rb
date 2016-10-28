class AddSourceCountryToIndicator < ActiveRecord::Migration
  def change
    add_column :indicators, :source_country, :string
  end
end
