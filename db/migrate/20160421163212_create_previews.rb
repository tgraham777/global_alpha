class CreatePreviews < ActiveRecord::Migration
  def change
    create_table :previews do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
