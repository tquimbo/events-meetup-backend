class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name

  # has_many :user_events


  
  # has_many :events
  # has_many :user_events
  # has_many :events, through: :user_events
  
end
