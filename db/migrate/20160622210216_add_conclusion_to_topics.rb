class AddConclusionToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :conclusion, :text
  end
end
