class RemoveEndTimeFromTimeAndPlaces < ActiveRecord::Migration
  def change
    remove_column :time_and_places, :end_time, :time
  end
end
