class AddIntroToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :intro, :text
  end
end
