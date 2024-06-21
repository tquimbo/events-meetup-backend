
class EventsController < ApplicationController

  # def index
  #     events = Event.all
  #     render json: events
  # end

  def index
    events = Event.all
    render json: events, each_serializer: EventSerializer
  end


  def show
      event = Event.find(params[:id])
      render json: event, serializer: EventShowSerializer
    end

    def update_attendees
      # Your logic for updating the attendees
      # ...
      @event = Event.find(params[:id])

      if @event.update(event_params)
        # update successful
        redirect_to @event
      else
        # update failed
        render 'edit'
      end
    
      # Broadcast the updated event to the channel
      ActionCable.server.broadcast("events_#{event.id}", event: render_event(event))
    end

    def trending
      # Example logic: Trending events could be those with the most attendees in the last 7 days
      trending_events = Event.joins(:attendees)
                             .where('attendances.created_at >= ?', 7.days.ago)
                             .group('events.id')
                             .order('COUNT(attendances.id) DESC')
                             .limit(10)
      render json: trending_events
    end
    
    private
    
    def render_event(event)
      ApplicationController.renderer.render(partial: 'events/event', locals: { event: event })
    end
    


    private

  def event_params
    params.permit(:performer_name, :performer_image, :venue_name, :venue_address, :datetime, :seatgeek_id, :id, :user_id, :users, :formatted_datetime )
  end




end


