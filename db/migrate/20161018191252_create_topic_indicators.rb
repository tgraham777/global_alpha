class CreateTopicIndicators < ActiveRecord::Migration
  def change
    create_table :topic_indicators do |t|
      t.references :topic, index: true, foreign_key: true
      t.references :indicator, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
