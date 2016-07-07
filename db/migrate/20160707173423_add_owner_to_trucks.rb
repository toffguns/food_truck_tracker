class AddOwnerToTrucks < ActiveRecord::Migration
  def change
    add_reference :trucks, :owner, index: true, foreign_key: true
  end
end
