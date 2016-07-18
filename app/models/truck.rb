class Truck < ActiveRecord::Base
  validates :name, :cuisine, :menu, :owner, presence: true
  belongs_to :owner
  has_many :time_and_places, dependent: :destroy
  has_many :reviews
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :image, presence: true,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }
end
