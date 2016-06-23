class AddVisualCountToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :visual_count, :integer
  end
end
