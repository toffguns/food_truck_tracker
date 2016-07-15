class RemoveTimeAndPlaceFromTruck < ActiveRecord::Migration
  def change
    remove_reference :trucks, :time_and_place, index: true, foreign_key: true
  end
end
