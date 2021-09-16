class Api::V1::UsersController < ApplicationController 

        def index 
            @users = User.all 
        end
  
def new
    @user = User.new 
end


 def create 
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      render json:  UserSerializer.new(@user), status: :created
    elsif
        @user = User.new(user_params)
        if @user.save!
            session[:user_id] = @user.id
            render json: UserSerializer.new(@user), status: :created
        end
    else
        render json: { message: "Error" }, status: :unprocessable_entity
    end
end

   private 

   def user_params
    params.require(:user).permit(:username, :password)
   end
end
