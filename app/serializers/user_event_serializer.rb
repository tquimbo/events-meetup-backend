class UserEventSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :event_id, :username, :performer_name, :performer_image, :venue_name, :venue_address, :datetime, :performer_image, :username

  def username
    self.object.user.username
  end


end
