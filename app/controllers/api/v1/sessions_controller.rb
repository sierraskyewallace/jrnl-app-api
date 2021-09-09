class Api::V1::SessionsController < ApplicationController

    

def create
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      render json: { user: UserSerializer.new(@user) }, status: :created
    else
      render json: { message: "Incorrect Username/Password." }, status: :unprocessable_entity
    end
  end

  private 

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
