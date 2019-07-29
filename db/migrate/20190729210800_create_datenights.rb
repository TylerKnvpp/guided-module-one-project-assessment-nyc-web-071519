class CreateDatenights < ActiveRecord::Migration[5.2]
  def change
    		 create_table :datenights do |t|
          t.integer :user_id
          t.integer :restaurant_id
          t.datetime :planned_date
          t.timestamps
       end
    end
end
