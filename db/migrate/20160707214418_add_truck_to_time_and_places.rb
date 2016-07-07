class AddTruckToTimeAndPlaces < ActiveRecord::Migration
  def change
    add_reference :time_and_places, :truck, index: true, foreign_key: true
  end
end
