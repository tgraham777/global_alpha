class AddColumnsToPreview < ActiveRecord::Migration
  def change
    add_column :previews, :intro, :text
    add_column :previews, :conclusion, :text
    add_column :previews, :report_date, :string
  end
end
