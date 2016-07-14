class AddDescriptionColumnToVisual < ActiveRecord::Migration
  def change
    add_column :visuals, :description, :text
  end
end
