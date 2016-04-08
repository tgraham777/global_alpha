class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :title
      t.text :body

      t.timestamps null: false
    end
  end
end
