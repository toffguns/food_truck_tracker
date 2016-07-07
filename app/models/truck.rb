class Truck < ActiveRecord::Base
  validates :name, :cuisine, :menu, presence: true
  belongs_to :owner
end
