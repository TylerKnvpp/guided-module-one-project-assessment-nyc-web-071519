class CreateCouples < ActiveRecord::Migration[5.2]
  def change
    		 create_table :couples do |t|
          t.string :username
          t.string :password
          t.string :full_name
         end
    end
end
