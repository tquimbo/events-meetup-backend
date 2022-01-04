class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :performer_name
      t.string :performer_image
      t.string :venue_name
      t.string :venue_address
      t.string :venue_city
      t.string :venue_state
      t.string :venue_country
      t.integer :venue_zipcode
      t.datetime :datetime
      t.string :attendance_status
      t.string :event_type
      t.integer :seatgeek_id

      t.timestamps
    end
  end
end
