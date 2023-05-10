class UserEventsController < ApplicationController

  def index
      user_events = UserEvent.all
      render json: user_events
      # render json: user_events, include: [:user]
  end


def create
  user = User.find(user_event_params[:user_id])
  event = Event.find(user_event_params[:event_id])

  if user && event
    user_event = UserEvent.find_or_create_by(user_id: user.id, event_id: event.id)
    user.user_events << user_event
  end
end


  def user_event_params
      params.require(:user_event).permit(:performer_name, :performer_image, :venue_name, :venue_address, :datetime, :username, :first_name, :last_name, :id, :user_id, :event_id, :user_event)
    end



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

  # def create
  #   # current_user = User.find(user_event_params[:user_id]) 
  #   # if current_user == session[:user_id]
  #     user_event = UserEvent.create(user_event_params)
  #     render json: user_event
  #     # render json: user_event, include: [:users]
          
  #   end


#   def create
#   user = User.find(params[:id])
#   user_event = Event.find(params[:event_id])
#   if user && user_event
#     user.user_events << user_event
#       end
# end

# def create
#   user = User.find(user_event_params[:user_id])
#   event = Event.find(user_event_params[:event_id])
#   if user && event
#     user_event = UserEvent.create(user_event_params)
#     user.user_events << user_event
#       end
# end


    # user_event = current_user.user_events.build(user_event_params)


    # user_event.user_id = session[:user_id]

      
      
     
    #       byebug
    # user_event = UserEvent.create(user_event_params)

          # user_event.users << user

          
          # render json: user_event, include: [:user]
          
      #   else
      #     render json: { error: 'failed to create event'}, status: :not_acceptable
      # end  
      # end
      
  # end




  private

  # def user_event_params
  #     params.require(:user_event).permit(:user_id, :event_id)
  # end
# class UserEventsController < ApplicationController

#     def index
#         user_events = UserEvent.all
#         render json: user_events
#         # render json: user_events, include: [:user]
#     end


#   def create
#     user = User.find(user_event_params[:user_id])
#     event = Event.find(user_event_params[:event_id])
  
#     if user && event
#       user_event = UserEvent.find_or_create_by(user_id: user.id, event_id: event.id)
  
#       # Update user_event attributes
#       user_event.update(
#         performer_name: user_event_params[:performer_name],
#         venue_name: user_event_params[:venue_name],
#         venue_address: user_event_params[:venue_address],
#         username: user_event_params[:username],
#         first_name: user_event_params[:first_name],
#         last_name: user_event_params[:last_name]
#       )
  
#       user.user_events << user_event
  
#       # Render the created user_event as JSON
#       render json: user_event
#     end
#   end
  


#       # user_event = current_user.user_events.build(user_event_params)


#       # user_event.user_id = session[:user_id]

        
        
       
#       #       byebug
#       # user_event = UserEvent.create(user_event_params)

#             # user_event.users << user

            
#             # render json: user_event, include: [:user]
            
#         #   else
#         #     render json: { error: 'failed to create event'}, status: :not_acceptable
#         # end  
#         # end
        
#     # end




#     private

#     # def user_event_params
#     #     params.require(:user_event).permit(:user_id, :event_id)
#     # end

#     def user_event_params
#         params.require(:user_event).permit(:performer_name, :performer_image, :venue_name, :venue_address, :datetime, :username, :first_name, :last_name, :id, :user_id, :event_id, :user_event)
#       end
  


# end
