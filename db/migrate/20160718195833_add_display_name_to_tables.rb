class AddDisplayNameToTables < ActiveRecord::Migration
  def change
    add_column :countries, :display_name, :string
    add_column :indicators, :display_name, :string
    add_column :previews, :display_name, :string
    add_column :tags, :display_name, :string
    add_column :users, :display_name, :string
  end
end
