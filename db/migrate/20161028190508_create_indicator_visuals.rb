class CreateIndicatorVisuals < ActiveRecord::Migration
  def change
    create_table :indicator_visuals do |t|
      t.references :indicator, index: true, foreign_key: true
      t.references :visual, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
