class AddEndTimeToTimeAndPlaces < ActiveRecord::Migration
  def change
    add_column :time_and_places, :end_time, :datetime
  end
end
