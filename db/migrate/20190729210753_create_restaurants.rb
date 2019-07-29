class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    		 create_table :restaurants do |t|
          t.integer :zomato_id
          t.string :name
          t.integer :zip
          t.string :neighborhood
          t.float :rating
          t.float :avg_cost
         end
    end
end
