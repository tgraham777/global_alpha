class RemoveForeignKeysFromDescriptions < ActiveRecord::Migration
  def change
    remove_foreign_key :descriptions, :topics
    remove_foreign_key :descriptions, :visuals
  end
end
