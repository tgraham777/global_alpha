class RemoveVisualUrlColumnFromTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :visual_link
  end
end
