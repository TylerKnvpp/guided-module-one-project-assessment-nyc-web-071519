class RenameColumnsInResturants < ActiveRecord::Migration[5.2]
  def change
    rename_column :restaurants, :zomato_id, :yelp_id
    change_column :restaurants, :yelp_id, :string
    rename_column :restaurants, :avg_cost, :price
    change_column :restaurants, :price, :string
    remove_column :restaurants, :zip
    add_column :restaurants, :phone_num, :string
    add_column :restaurants, :url, :string
  end
end
