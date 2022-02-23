class EventSerializer < ActiveModel::Serializer
  attributes :id, :performer_name, :venue_name, :venue_address, :datetime, :performer_image
  belongs_to :user

end

