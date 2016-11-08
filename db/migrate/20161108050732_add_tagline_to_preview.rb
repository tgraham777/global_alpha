class AddTaglineToPreview < ActiveRecord::Migration
  def change
    add_column :previews, :tagline, :text
  end
end
