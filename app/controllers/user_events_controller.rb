class UserEventsController < ApplicationController

    def index
        user_events = UserEvent.all
        render json: user_events
    end

    def create
        user = User.find(user_event_params[:user_id]) 
        event = Event.find(user_event_params[:event_id])
        if event.user_owner_id === user.id
            render json: { error: "You already added this event!"}
        # else
        #     render json: { error: 'failed to add event'}, status: :not_acceptable
        else
            user_event = UserEvent.create(user_event_params)
            render json: event, include: [:users]
        end
    end


    private

    def user_event_params
        params.require(:user_event).permit(:user_id, :event_id)
    end


end
