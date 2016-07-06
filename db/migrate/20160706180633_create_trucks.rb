class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name
      t.text :cuisine
      t.text :menu

      t.timestamps null: false
    end
  end
end
