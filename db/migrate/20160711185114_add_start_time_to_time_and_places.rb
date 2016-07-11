class AddStartTimeToTimeAndPlaces < ActiveRecord::Migration
  def change
    add_column :time_and_places, :start_time, :datetime
  end
end
