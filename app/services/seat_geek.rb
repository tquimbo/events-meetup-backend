require "http"


class SeatGeek

    attr_reader :response, :events

    def initialize(input)
      # url = "https://api.seatgeek.com/2/events?client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy"
      params = {
        input: input
      }
  
      # @response = HTTP.get("https://api.seatgeek.com/2/performers?client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy").parse
        @response = HTTP.get("https://api.seatgeek.com/2/events?q=#{params[:input]}&client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy").parse
      # response = HTTP.auth('#{ENV["client_id"],ENV["client_secret"]}').get(url, params: params)
      # @response = response.parse
      @events = @response["events"]

    end

       def to_events
       event_ids = self.events.map do |e|
        Event.find_or_create_by(id: e["id"]) do |event|
            event.performer_name = e["performers"][0]["name"]
            event.performer_image = e["performers"][0]["image"]
            event.venue_name = e["venue"]["name"]
            event.venue_address = e["venue"]["extended_address"]
            event.venue_city = e["venue"]["city"]
            event.venue_state = e["venue"]["state"]
            event.venue_country = e["venue"]["country"]
            event.venue_zipcode= e["venue"]["postal_code"]
            event.datetime = e["datetime_local"]          
        end.id
      end
      Event.where(id: events_ids)
    end
 
 
  end
    
  
  
