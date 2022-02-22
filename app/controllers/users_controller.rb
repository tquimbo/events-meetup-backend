class UsersController < ApplicationController


  def index
    users = User.all
    render json: users
end

    # def create
    #     user = User.new(user_params)
    #     if user.save
    #       session[:user_id] = @user.id
    #       render json: user
    #     else
    #       render json: {errors: user.errors.full_messages.to_sentence}, status: :unprocessable_entity
    #     end
    # end

  #   def create
  #     user = User.create(user_params)
  #     if user.valid?
  #         token = encode_token(user_id: user.id)
  #         render json: { user: UserSerializer.new(user), jwt: token }, status: :created
  #     else
  #         render json: { error: 'failed to create user'}, status: :not_acceptable
  #     end
  # end

  
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
      params.permit(:username, :password, :first_name, :last_name)
    end
  
  end