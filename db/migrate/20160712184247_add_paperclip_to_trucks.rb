class AddPaperclipToTrucks < ActiveRecord::Migration
  def change
    add_attachment :trucks, :image
  end
end
