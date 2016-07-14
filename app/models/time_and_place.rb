class TimeAndPlace < ActiveRecord::Base
  validates :street_address, :city, :state, :zip_code, :truck_id, :presence => true
  geocoded_by :full_address
  after_validation :geocode
  belongs_to :truck

  def full_address
    street_address + " " + city + " " + state + " " + zip_code
  end
end
