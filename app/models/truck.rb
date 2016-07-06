class Truck < ActiveRecord::Base
  validates :name, :cuisine, :menu, presence: true
end
