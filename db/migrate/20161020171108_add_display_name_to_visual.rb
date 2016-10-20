class AddDisplayNameToVisual < ActiveRecord::Migration
  def change
    add_column :visuals, :display_name, :string
  end
end
