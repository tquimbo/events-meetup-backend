# class UserEventSerializer < ActiveModel::Serializer
#   attributes :id, :user_id, :event_id, :username, :performer_name, :venue_name, :venue_address

#   def username
#     self.object.user.username
#   end


# end
class UserEventSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :event_id, :username, :performer_name, :venue_name, :venue_address

  def username
    self.object.user.username
  end

  # def formatted_datetime
  #   self.object.datetime.strftime("%b %-d, %Y %-I:%M %p")
  # end
end