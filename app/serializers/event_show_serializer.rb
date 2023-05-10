class EventShowSerializer < ActiveModel::Serializer
  attributes :id, :performer_name, :venue_name, :venue_address, :attendance_status, :datetime, :performer_image, :users, :formatted_datetime

  def formatted_datetime
    self.object.datetime.strftime("%b %-d, %Y %-I:%M %p")
  end

end
