class AddReportDateToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :report_date, :string
  end
end
