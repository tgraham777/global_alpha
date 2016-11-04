class CreatePreviewTopics < ActiveRecord::Migration
  def change
    create_table :preview_topics do |t|
      t.references :preview, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
