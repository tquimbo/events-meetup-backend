class CreateUserEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_events do |t|
      t.bigint :user_id
      t.bigint :event_id

      t.timestamps
    end
  end
end
