class CreatePreviewTags < ActiveRecord::Migration
  def change
    create_table :preview_tags do |t|
      t.references :preview, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
