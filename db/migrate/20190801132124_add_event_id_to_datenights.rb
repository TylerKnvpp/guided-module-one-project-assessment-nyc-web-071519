class AddEventIdToDatenights < ActiveRecord::Migration[5.2]
  def change
    add_column :datenights, :event_id, :integer
  end
end
