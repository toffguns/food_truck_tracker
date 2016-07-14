class Review < ActiveRecord::Base
  belongs_to :contributor
	belongs_to :truck
  
end
