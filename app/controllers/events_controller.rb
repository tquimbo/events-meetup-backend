class EventsController < ApplicationController

    def self.search(input)
        SeatGeek.new(input).to_events
    end
    
end
