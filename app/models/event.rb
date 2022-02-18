class Event < ApplicationRecord

  has_many :users, through: :user_events
  
  def self.search(input)
    SeatGeek.new(input).to_events
end

end
