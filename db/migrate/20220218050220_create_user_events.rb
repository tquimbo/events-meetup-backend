class CreateUserEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_events do |t|
      t.big_int :user_id
      t.big_int :event_id

      t.timestamps
    end
  end
end
