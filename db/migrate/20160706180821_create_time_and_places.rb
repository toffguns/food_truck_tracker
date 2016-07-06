class CreateTimeAndPlaces < ActiveRecord::Migration
  def change
    create_table :time_and_places do |t|
      t.time :start_time
      t.time :end_time
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
