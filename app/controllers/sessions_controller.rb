# require 'jwt'

class SessionsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      render_user_with_token(user)
      # session[:user_id] = @user.id
    else
      render json: {errors: "Invalid Username and/or Password, get good!"}, status: :forbidden
    end
  end

  def autologin
    render_user_with_token(logged_in_user)
  end

end