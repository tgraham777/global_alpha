class CreateCountryIndicators < ActiveRecord::Migration
  def change
    create_table :country_indicators do |t|
      t.references :country, index: true, foreign_key: true
      t.references :indicator, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
