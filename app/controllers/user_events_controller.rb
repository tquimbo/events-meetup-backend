class UserEventsController < ApplicationController

    def create
        if user = User.find(user_run_params[:user_id]) && event = Event.find(user_run_params[:event_id])
            user_event = UserEvent.create(user_run_params)
            render json: event, include: [:users]
        else 
            render json: { error: 'failed to add event'}, status: :not_acceptable
        end  
    end


    private

    def user_event_params
        params.require(:user_event).permit(:user_id, :event_id)
    end
end


end
