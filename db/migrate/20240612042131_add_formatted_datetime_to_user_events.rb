class AddFormattedDatetimeToUserEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_events, :formatted_datetime, :string
  end
end
