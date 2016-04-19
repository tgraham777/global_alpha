class CreateCountryTags < ActiveRecord::Migration
  def change
    create_table :country_tags do |t|
      t.references :country, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
