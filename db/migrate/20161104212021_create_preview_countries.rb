class CreatePreviewCountries < ActiveRecord::Migration
  def change
    create_table :preview_countries do |t|
      t.references :preview, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
