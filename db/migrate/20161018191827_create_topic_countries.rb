class CreateTopicCountries < ActiveRecord::Migration
  def change
    create_table :topic_countries do |t|
      t.references :topic, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
