class CreateCountryVisuals < ActiveRecord::Migration
  def change
    create_table :country_visuals do |t|
      t.references :country, index: true, foreign_key: true
      t.references :visual, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
