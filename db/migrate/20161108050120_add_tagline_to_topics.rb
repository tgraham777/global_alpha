class AddTaglineToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :tagline, :text
  end
end
