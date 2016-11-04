class CreatePreviewIndicators < ActiveRecord::Migration
  def change
    create_table :preview_indicators do |t|
      t.references :preview, index: true, foreign_key: true
      t.references :indicator, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
