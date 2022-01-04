require "http"


class SeatGeek

    attr_reader :response, :events

    def initialize(input)
      url = "https://api.seatgeek.com/2/events?client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy"
      params = {
        input: input
      }
  
      @response = HTTP.get("https://api.seatgeek.com/2/events?client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy").parse
      # response = HTTP.auth('#{ENV["client_id"],ENV["client_secret"]}').get(url, params: params)
      # @response = response.parse
      @events = @response["events"]

    end
 
 
  end
    
  
  
