class UserEventsController < ApplicationController

    def index
        user_events = UserEvent.all
        render json: user_events, include: [:users]
    end

    # def create
    #   user = User.find_by(id: user_event_params[:user_id])

    #     if user
        
    #         user_event = UserEvent.create(user_event_params)
            
    #         render json: user_event
            
    #       else
    #         render json: { error: 'failed to create event'}, status: :not_acceptable
    #     end  
        
    # end

    def create
      user = User.find_by(id: user_event_params[:user_id])

        if user
        
            user_event = UserEvent.create(user_event_params)

            # byebug
            
            render json: user_event
            
        #   else
        #     render json: { error: 'failed to create event'}, status: :not_acceptable
        # end  
        end
        
    end




    private

    # def user_event_params
    #     params.require(:user_event).permit(:user_id, :event_id)
    # end

    def user_event_params
        params.require(:user_event).permit(:performer_name, :performer_image, :venue_name, :venue_address, :datetime, :username, :first_name, :last_name, :id, :user_id, :event_id, :user_event)
      end
  


end
