class RemoveStartTimeFromTimeAndPlaces < ActiveRecord::Migration
  def change
    remove_column :time_and_places, :start_time, :time
  end
end
