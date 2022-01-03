class SeatGeek

    attr_reader :response, :businesses
  
    def initialize(type, location, artist, event, venue)
      url = "https://api.seatgeek.com/2/events/"
      params = {
        type: type,
        location: location
        artist: artist,
        event: event,
        venue: venue, 
      }
  
      response = HTTP.auth("Bearer #{ENV["SEATGEEK_API_KEY"]}").get(url, params: params)
      @response = response.parse
      @events = @response["events"]
    end
  
    def to_events
      events_ids = self.events.map do |event|
        Event.find_or_create_by(seatgeek_id: event["id"]) do |event|
            event.performer_name = event["performers"]["name"]
            event.performer_image = event["performers"]["image"]
            event.venue_name = event["venue"]["name"]
            event.venue_name = event["venue"]["name"]
            event.venue_address = event["venue"]["address"]
            event.venue_city = event["venue"]["city"]
            event.venue_state = event["venue"]["state"]
            event.venue_country = event["venue"]["country"]
            event.venue_zipcode= event["venue"]["postal_code"]
            event.datetime = event["datetime_local"]          
        end.id
      end
      Event.where(id: events_ids)
    end
  
  end
  
  
