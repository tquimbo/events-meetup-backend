class EventShowSerializer < ActiveModel::Serializer
  attributes :id, :performer_name, :venue_name, :venue_address, :attendance_status, :datetime, :performer_image, :attendees

end
