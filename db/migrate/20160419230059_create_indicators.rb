class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
