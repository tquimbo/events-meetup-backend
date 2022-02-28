class UserEventsController < ApplicationController

    def index
        user_events = UserEvent.all
        render json: user_events, include: [:users]
    end

    def create

        
        
            user_event = logged_in_user.user_events.create(user_event_params)
            
    
            render json: user_event, include: [:users]
        
  
    end



    private

    # def user_event_params
    #     params.require(:user_event).permit(:user_id, :event_id)
    # end

    def user_event_params
        params.permit(:performer_name, :performer_image, :venue_name, :venue_address, :datetime, :username, :first_name, :last_name, :id, :user_id, :event_id)
      end
  


end
