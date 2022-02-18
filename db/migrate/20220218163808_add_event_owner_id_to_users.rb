class AddEventOwnerIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :event_owner_id, :integer
  end
end
