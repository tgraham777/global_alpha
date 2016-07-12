class AddColumnDisplayNameToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :display_name, :string
  end
end
