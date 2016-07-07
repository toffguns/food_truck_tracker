class Truck < ActiveRecord::Base
  validates :name, :cuisine, :menu, presence: true
  belongs_to :owner
  has_many :time_and_places
end
