class SessionsController < ApplicationController

    def create
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
          render_user_with_token(user)
        else
          render json: {errors: "Invalid Username and/or Password, get good!"}, status: :forbidden
        end
      end
      
end
