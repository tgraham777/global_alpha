class CreateTopicTags < ActiveRecord::Migration
  def change
    create_table :topic_tags do |t|
      t.references :topic, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
