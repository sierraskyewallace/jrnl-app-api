class Api::V1::UsersController < ApplicationController 

        def index 
            @users = User.all 
            render json: UserSerializer.new(@users)
        end
        
        def new 
            @user = User.new
        end

        def create
            ##create new user unless user already exists then log them in 
            @user = User.find_by(username: user_params[:username])
            if @user && @user.authenticate(user_params[:password])
                render json: UserSerializer.new(@user)
            else
                @user = User.new(user_params)
                if @user.save!
                    render json: UserSerializer.new(@user)
                else
                    render json: {error: @user.errors.full_messages}
                end
            end
        end
     


 


   private 

   def user_params
    params.require(:user).permit(:username, :password)
   end
end

