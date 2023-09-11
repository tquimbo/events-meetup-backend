module Api
    module V1
      class NearbyController < ApplicationController
        require 'httparty'
    
        def index
            def index
                lat = params[:lat]
                lon = params[:lon]
                # ...
              
                response = HTTParty.get("https://api.seatgeek.com/2/events?lat=#{lat}&lon=#{lon}&range=50mi")
                # ... rest of the code
          events = response["events"]
  
          event_ids = events.map do |e|
            Event.find_or_create_by(id: e["id"]) do |event|
              event.performer_name = e["performers"][0]["name"]
              event.performer_image = e["performers"][0]["image"]
              event.venue_name = e["venue"]["name"]
              event.venue_address = e["venue"]["extended_address"]
              event.venue_city = e["venue"]["city"]
              event.venue_state = e["venue"]["state"]
              event.venue_country = e["venue"]["country"]
              event.venue_zipcode = e["venue"]["postal_code"]
              event.datetime = e["datetime_local"]          
            end.id
          end
  
          events = Event.where(id: event_ids)
          render json: events
        end
      end
    end
  end