class ChangeColumnNameForPreview < ActiveRecord::Migration
  def change
    rename_column :previews, :name, :title
  end
end
