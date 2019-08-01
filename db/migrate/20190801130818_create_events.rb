class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :yelp_id
      t.string :name
      t.string :neighborhood
      t.string :cost
      t.string :url  
      t.datetime :start_time
      t.datetime :end_time
      t.text :description
      t.boolean :is_free
    end
  end
end
