# class UserEventsController < ApplicationController

#   def index
#       user_events = UserEvent.all
#       render json: user_events
#       # render json: user_events, include: [:user]
#   end


# # def create
# #   user = User.find(user_event_params[:user_id])
# #   event = Event.find(user_event_params[:event_id])

# #   if user && event
# #     user_event = UserEvent.find_or_create_by(user_id: user.id, event_id: event.id)
# #     user.user_events << user_event
# #   end
# # end

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
#         last_name: user_event_params[:last_name],
#         # formatted_datetime: user_event_params[:formatted_datetime],
#       )
  
#       user.user_events << user_event
  
#       # Render the created user_event as JSON
#       render json: user_event
#     end
#   end
  


#   def user_event_params
#       params.require(:user_event).permit(:performer_name, :performer_image, :venue_name, :venue_address, :datetime, :username, :first_name, :last_name, :id, :user_id, :event_id, :user_event, :formatted_datetime)
#     end



# end
# class UserEventsController < ApplicationController

#   def index
#     user_events = UserEvent.all
#     render json: user_events
#   end

#   def create
#     user_id = user_event_params[:user_id]
#     event_id = user_event_params[:event_id]

#     # Check for presence of user_id and event_id
#     if user_id.blank? || event_id.blank?
#       return render json: { error: 'User ID and Event ID must be provided' }, status: :bad_request
#     end

#     begin
#       user = User.find(user_id)
#       event = Event.find(event_id)
#     rescue ActiveRecord::RecordNotFound => e
#       return render json: { error: e.message }, status: :not_found
#     end

#     # Find or create the UserEvent
#     user_event = UserEvent.find_or_create_by(user_id: user.id, event_id: event.id)
  
#     # Update user_event attributes
#     user_event.update(
#       performer_name: user_event_params[:performer_name],
#       venue_name: user_event_params[:venue_name],
#       venue_address: user_event_params[:venue_address],
#       username: user_event_params[:username],
#       first_name: user_event_params[:first_name],
#       last_name: user_event_params[:last_name],
#       formatted_datetime: user_event_params[:formatted_datetime]
#     )

#     # Save the user_event and handle potential validation errors
#     if user_event.save
#       render json: user_event, status: :created
#     else
#       render json: { errors: user_event.errors.full_messages }, status: :unprocessable_entity
#     end
#   end

#   private

#   def user_event_params
#     params.require(:user_event).permit(
#       :performer_name, 
#       :performer_image, 
#       :venue_name, 
#       :venue_address, 
#       :datetime, 
#       :username, 
#       :first_name, 
#       :last_name, 
#       :user_id, 
#       :event_id, 
#       :formatted_datetime
#     )
#   end

# end
class UserEventsController < ApplicationController

  def index
      user_events = UserEvent.all
      render json: user_events
      # render json: user_events, include: [:user]
  end


# def create
#   user = User.find(user_event_params[:user_id])
#   event = Event.find(user_event_params[:event_id])

#   if user && event
#     user_event = UserEvent.find_or_create_by(user_id: user.id, event_id: event.id)
#     user.user_events << user_event
#   end
# end

  def create
    user = User.find(user_event_params[:user_id])
    event = Event.find(user_event_params[:event_id])
  
    if user && event
      user_event = UserEvent.find_or_create_by(user_id: user.id, event_id: event.id)
  
      # Update user_event attributes
      user_event.update(
        performer_name: user_event_params[:performer_name],
        venue_name: user_event_params[:venue_name],
        venue_address: user_event_params[:venue_address],
        username: user_event_params[:username],
        first_name: user_event_params[:first_name],
        last_name: user_event_params[:last_name],
        formatted_datetime: user_event_params[:formatted_datetime],
      )
  
      user.user_events << user_event
  
      # Render the created user_event as JSON
      render json: user_event
    end
  end
  


  def user_event_params
      params.require(:user_event).permit(:performer_name, :performer_image, :venue_name, :venue_address, :datetime, :username, :first_name, :last_name, :id, :user_id, :event_id, :user_event, :formatted_datetime)
    end



end