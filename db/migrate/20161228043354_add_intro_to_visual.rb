class AddIntroToVisual < ActiveRecord::Migration
  def change
    add_column :visuals, :intro, :text
  end
end
