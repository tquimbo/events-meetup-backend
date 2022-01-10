class Event < ApplicationRecord

  def self.search(input)
    SeatGeek.new(input).to_events
end

end
