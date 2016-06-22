class CreateVisuals < ActiveRecord::Migration
  def change
    create_table :visuals do |t|
      t.string :link
      t.string :caption

      t.timestamps null: false
    end
  end
end
