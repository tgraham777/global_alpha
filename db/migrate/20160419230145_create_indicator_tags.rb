class CreateIndicatorTags < ActiveRecord::Migration
  def change
    create_table :indicator_tags do |t|
      t.references :indicator, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
