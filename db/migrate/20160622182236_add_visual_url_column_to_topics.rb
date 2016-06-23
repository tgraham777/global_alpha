class AddVisualUrlColumnToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :visual_link, :text
  end
end
