class RemoveVisualCountFromTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :visual_count
  end
end
