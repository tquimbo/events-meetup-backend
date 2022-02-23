class UserEventsController < ApplicationController

    def index
        user_events = UserEvent.all
        render json: user_events
    end


    def create
        user = User.find(user_event_params[:user_id])
        event = Event.find(user_event_params[:event_id])
        if event.user_owner_id === user.id
            render json: { error: "You added this event!"}
        else
            user_event = UserEvent.create(user_event_params)
            render json: event, include: [:users]
        end
        
    end

    # def create
    #     # if user = User.find(user_event_params[:user_id])
    #     #     if event = Event.find(user_event_params[:event_id])
    #     user_event = UserEvent.create(user_event_params)
    #     render json: event, include: [:users]
    #     # user = User.find_by_username(params[:username])
    #     # user = User.find(user_event_params[:user_id])
    #     # event = Event.find(user_event_params[:event_id])
    #     # if user && event
    #     #     user_event = UserEvent.create(user_event_params)
    #     #     render json: user_event
    #     # end
    #     # if event.user_owner_id === user.id
    #     #     render json: { error: "You already added this event!"}
    #     # # else
    #     # #     render json: { error: 'failed to add event'}, status: :not_acceptable
    #     # else
    #     #     user_event = UserEvent.create(user_event_params)
    #         # render json: event, include: [:users]
    #     # end
    # end

    # def show
    #     render json: event, include: ['chats', 'chats.messages']
    #   end

    # def new
    #     if user = User.find(user_event_params[:user_id]) && event = Event.find(user_event_params[:event_id])
    #     user_event = UserEvent.create(user_event_params)
    #     render json: event, include: [:users]
    #     # user = User.find_by_username(params[:username])
    #     # user = User.find(user_event_params[:user_id])
    #     # event = Event.find(user_event_params[:event_id])
    #     # if user && event
    #     #     user_event = UserEvent.create(user_event_params)
    #     #     render json: user_event
    #     # end
    #     # if event.user_owner_id === user.id
    #     #     render json: { error: "You already added this event!"}
    #     # # else
    #     # #     render json: { error: 'failed to add event'}, status: :not_acceptable
    #     # else
    #     #     user_event = UserEvent.create(user_event_params)
    #     #     render json: event, include: [:users]
    #     # end
    # end



    private

    # def user_event_params
    #     params.require(:user_event).permit(:user_id, :event_id)
    # end

    def user_event_params
        params.permit(:user_id, :event_id)
      end
  


end
