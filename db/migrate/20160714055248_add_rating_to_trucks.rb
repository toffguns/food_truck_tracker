class AddRatingToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :rating, :string
  end
end
