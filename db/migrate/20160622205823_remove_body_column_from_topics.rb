class RemoveBodyColumnFromTopics < ActiveRecord::Migration
  def change
    remove_column :topics, :body
  end
end
