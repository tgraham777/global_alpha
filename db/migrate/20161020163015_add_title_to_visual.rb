class AddTitleToVisual < ActiveRecord::Migration
  def change
    add_column :visuals, :title, :text
    add_column :visuals, :additional_description, :text
  end
end
