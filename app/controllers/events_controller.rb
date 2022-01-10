class EventsController < ApplicationController

    # def self.search(input)
    #     SeatGeek.new(input).to_events
    # end

    def index
        events = Event.all
        render json: events
        # render json: EventSerializer.new(events)
    end


end
