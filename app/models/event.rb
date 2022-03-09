class Event < ApplicationRecord

  # has_many :users, through: :user_events
  # has_many :user_events

  




  
  def self.search(input)
    SeatGeek.new(input).to_events
end

end
