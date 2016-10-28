class AddColumnsToIndicator < ActiveRecord::Migration
  def change
    add_column :indicators, :intro, :text
    add_column :indicators, :conclusion, :text
    add_column :indicators, :last_updated, :string
  end
end
