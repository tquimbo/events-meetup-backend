class AddUserOwnerIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :user_owner_id, :integer
  end
end
