class AddPropsToUserEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_events, :first_name, :string
    add_column :user_events, :last_name, :string
    add_column :user_events, :performer_name, :string
    add_column :user_events, :venue_address, :string
    add_column :user_events, :venue_name, :string
    add_column :user_events, :event_type, :string
  end
end
