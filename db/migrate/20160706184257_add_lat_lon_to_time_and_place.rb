class AddLatLonToTimeAndPlace < ActiveRecord::Migration
  def change
    add_column :time_and_places, :latitude, :float
    add_column :time_and_places, :longitude, :float
  end
end
