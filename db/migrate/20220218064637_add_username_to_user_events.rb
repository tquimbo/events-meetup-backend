class AddUsernameToUserEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_events, :username, :string
  end
end
