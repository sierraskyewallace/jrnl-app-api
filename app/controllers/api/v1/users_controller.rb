class Api::V1::UsersController < ApplicationController 

        def index 
            @users = User.all 
        end
  
def new
    @user = User.new 
end


  def create
    @user = User.new(user_params)
    if @user.save!
      session[:user_id] = @user.id
      render json: UserSerializer.new(@user), status: :created
    else
      render json: { message: "Unable to create a user. Please try again." }, status: :unprocessable_entity
    end
  end


   private 

   def user_params
    params.require(:user).permit(:username, :password)
   end
end
