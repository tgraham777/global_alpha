class AddDescriptionToVisuals < ActiveRecord::Migration
  def change
    add_reference :descriptions, :visual, index: true, foreign_key: true
  end
end
