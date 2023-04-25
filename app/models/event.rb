class Event < ApplicationRecord

  # has_many :users, through: :user_events
  # has_many :user_events
  has_many :user_events
  has_many :users, through: :user_events
  # has_many :attendees, through: :user_events, source: :user

  




  
  def self.search(input)
    SeatGeek.new(input).to_events
end

end
