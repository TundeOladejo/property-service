class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :address
      t.string :type
      t.integer :num_of_bedrooms
      t.integer :num_of_sitting_rooms
      t.integer :num_of_kitchens
      t.string :num_of_bathrooms
      t.integer :num_of_toilets
      t.string :owner
      t.string :description
      t.date :valid_from
      t.date :valid_to

      t.timestamps
    end
  end
end
