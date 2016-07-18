class Review < ActiveRecord::Base
  validates :contributor, :truck, presence: true
  belongs_to :contributor
	belongs_to :truck
end
