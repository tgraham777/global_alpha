class CreateTopicVisuals < ActiveRecord::Migration
  def change
    create_table :topic_visuals do |t|
      t.references :topic, index: true, foreign_key: true
      t.references :visual, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
