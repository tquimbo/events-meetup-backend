module Types
  class EventType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :performer_name, String, null: true
    field :performer_image, String, null: true
    field :venue_name, String, null: true
    field :venue_address, String, null: true
    field :venue_city, String, null: true
    field :venue_state, String, null: true
    field :venue_country, String, null: true
    field :venue_zipcode, Integer, null: true
    field :datetime, GraphQL::Types::ISO8601DateTime, null: true
    field :attendance_status, String, null: true
    field :event_type, String, null: true
    field :seatgeek_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
