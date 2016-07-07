class AddTimeAndPlaceToTrucks < ActiveRecord::Migration
  def change
    add_reference :trucks, :time_and_place, index: true, foreign_key: true
  end
end
