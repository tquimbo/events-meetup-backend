class EventsController < ApplicationController

    require 'rest-client'

    def get_events

    end


    def index
        events = Event.all
        render json: events
    end

        # def create
        #     event_ids = self.events.map do |e|
        #      Event.find_or_create_by(id: e["id"]) do |event|
        #          event.performer_name = e["performers"][0]["name"]
        #          event.performer_image = e["performers"][0]["image"]
        #          event.venue_name = e["venue"]["name"]
        #          event.venue_address = e["venue"]["extended_address"]
        #          event.venue_city = e["venue"]["city"]
        #          event.venue_state = e["venue"]["state"]
        #          event.venue_country = e["venue"]["country"]
        #          event.venue_zipcode= e["venue"]["postal_code"]
        #          event.datetime = e["datetime_local"]          
        #      end.id
        #    end
        #    Event.where(id: events_ids)
        #  end
 
      

    def show
        event = Event.find(params[:id])
        render json: event, serializer: EventShowSerializer
      end



end
