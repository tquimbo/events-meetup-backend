# module Api
#     module V1
#       class SearchController < ApplicationController
#         require 'httparty'
    
#         def index
#           input = params[:query]
  
#           response = HTTParty.get("https://api.seatgeek.com/2/events?performers.slug=#{input}&client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy")
#           events = response["events"]
  
#           event_ids = events.map do |e|
#             Event.find_or_create_by(id: e["id"]) do |event|
#               event.performer_name = e["performers"][0]["name"]
#               event.performer_image = e["performers"][0]["image"]
#               event.venue_name = e["venue"]["name"]
#               event.venue_address = e["venue"]["extended_address"]
#               event.venue_city = e["venue"]["city"]
#               event.venue_state = e["venue"]["state"]
#               event.venue_country = e["venue"]["country"]
#               event.venue_zipcode = e["venue"]["postal_code"]
#               event.datetime = e["datetime_local"]          
#             end.id
#           end
  
#           events = Event.where(id: event_ids)
#           render json: events
#         end
#       end
#     end
#   end
module Api
    module V1
      class SearchController < ApplicationController
        require 'httparty'
    
        def index
          # input = params[:query]
          input = params[:query].tr(" ", "-")
  
          response = HTTParty.get("https://api.seatgeek.com/2/events?performers.slug=#{input}&client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy")
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

# module Api
#     module V1
#       class SearchController < ApplicationController
#         require 'httparty'
  
#         def initialize(input)
#             # url = "https://api.seatgeek.com/2/events?client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy"
#             params = {
#               input: input
#             }
        
#             # @response = HTTP.get("https://api.seatgeek.com/2/performers?client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy").parse
#               # @response = HTTP.get("https://api.seatgeek.com/2/events?q=#{params[:input]}&client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy").parse
#               # @response = HTTP.get("https://api.seatgeek.com/2/events?per_page=5000&page=1&client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy").parse
#               @response = HTTP.get("https://api.seatgeek.com/2/events?performers.slug=#{params[:input]}&client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy").parse
              
              
              
#             # response = HTTP.auth('#{ENV["client_id"],ENV["client_secret"]}').get(url, params: params)
#             # @response = response.parse
#             @events = @response["events"]
      
#           end
      
#              def to_events
#              event_ids = self.events.map do |e|
#               Event.find_or_create_by(id: e["id"]) do |event|
#                   event.performer_name = e["performers"][0]["name"]
#                   event.performer_image = e["performers"][0]["image"]
#                   event.venue_name = e["venue"]["name"]
#                   event.venue_address = e["venue"]["extended_address"]
#                   event.venue_city = e["venue"]["city"]
#                   event.venue_state = e["venue"]["state"]
#                   event.venue_country = e["venue"]["country"]
#                   event.venue_zipcode= e["venue"]["postal_code"]
#                   event.datetime = e["datetime_local"]          
#               end.id
#             end
#             Event.where(id: events_ids)
#           end
#         # def index
#         #   query = params[:query]

#         # response = HTTParty.get("https://api.seatgeek.com/2/events?=#{query}")
#         #   render json: response.parsed_response
#         # end
#       end
#     end
#   end

#   require "http"


#   class SeatGeek
  
#       attr_reader :response, :events
  
#       def initialize(input)
#         # url = "https://api.seatgeek.com/2/events?client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy"
#         params = {
#           input: input
#         }
    
#         # @response = HTTP.get("https://api.seatgeek.com/2/performers?client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy").parse
#           # @response = HTTP.get("https://api.seatgeek.com/2/events?q=#{params[:input]}&client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy").parse
#           # @response = HTTP.get("https://api.seatgeek.com/2/events?per_page=5000&page=1&client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy").parse
#           @response = HTTP.get("https://api.seatgeek.com/2/events?performers.slug=#{params[:input]}&client_id=MjExMjk0NjV8MTY0MTA5MDU5OC40MTYzNzQy").parse
          
          
          
#         # response = HTTP.auth('#{ENV["client_id"],ENV["client_secret"]}').get(url, params: params)
#         # @response = response.parse
#         @events = @response["events"]
  
#       end
  
#          def to_events
#          event_ids = self.events.map do |e|
#           Event.find_or_create_by(id: e["id"]) do |event|
#               event.performer_name = e["performers"][0]["name"]
#               event.performer_image = e["performers"][0]["image"]
#               event.venue_name = e["venue"]["name"]
#               event.venue_address = e["venue"]["extended_address"]
#               event.venue_city = e["venue"]["city"]
#               event.venue_state = e["venue"]["state"]
#               event.venue_country = e["venue"]["country"]
#               event.venue_zipcode= e["venue"]["postal_code"]
#               event.datetime = e["datetime_local"]          
#           end.id
#         end
#         Event.where(id: events_ids)
#       end
   
   
#     end
      
    
    
  