class Event < ApplicationRecord

  has_many :users
  
  def self.search(input)
    SeatGeek.new(input).to_events
end

end
