class TimeAndPlace < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    street_address + " " + city + " " + state + " " + zip_code
  end
end
