class UsersController < ApplicationController 

  

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: UserSerializer.new(user), status: :created
    else
      render json: { message: "Try again" }, status: :denied
    end
  end

  def new
    @user = User.new
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: UserSerializer.new(user), status: :created
    else
      render json: { message: "try again" }, status: :denied
    end
  end




   private 

   def user_params
    params.require(:user).permit(:username, :password)
   end
end
