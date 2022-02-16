
class EventsController < ApplicationController



    def index
        events = Event.all
        render json: events
    end

    def create
        event = SeatGeek.new(params[:performer_name])
        if event.save
            render json: event
          else
            render json: {errors: user.errors.full_messages.to_sentence}, status: :unprocessable_entity
        end
    end

 
      

    def show
        event = Event.find(params[:id])
        render json: event, serializer: EventShowSerializer
      end



end
