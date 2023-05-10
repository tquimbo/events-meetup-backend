class UsersController < ApplicationController


  def index
    users = User.all
    render json: users
end



  
  def show
    user = User.find(params[:id])
    render json: user
  end


  def create
    user = User.new(user_params)
    if user.save
      render_user_with_token(user)
    else
      render json: {errors: user.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end
  end


  
    private
  
    def user_params
      params.permit(:username, :password, :first_name, :last_name, :user_events)
    end
  
  end