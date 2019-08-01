class UpdateColumnNameOnDatenights < ActiveRecord::Migration[5.2]
  def change
    rename_column :datenights, :user_id, :couple_id
  end
end
