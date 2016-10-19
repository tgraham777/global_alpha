class AddColumnsToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :intro, :text
    add_column :countries, :conclusion, :text
    add_column :countries, :last_updated, :string
  end
end
