class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :contributor_id
      t.integer :truck_id

      t.timestamps null: false
    end
  end
end
