class UserEventSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :event_id, :username, :performer_name, :venue_name, :venue_address, :datetime, :performer_image

  belongs_to :users
  belongs_to :events


  def username
    self.object.user.username
  end

end
