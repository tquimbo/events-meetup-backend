class UserEventSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :event_id, :username

  belongs_to :users
  belongs_to :events


  def username
    self.object.user.username

  end

end
