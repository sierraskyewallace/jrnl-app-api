class Api::V1::UsersController < ApplicationController 

        def index 
            @users = User.all 
            render json: UserSerializer.new(@users)
        end
  
        def create
            ## find user by username and sign in or create a new user if username doesnt exist
            @user = User.find_by(params[:username])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                render json: UserSerializer.new(@user)
            else
                @user = User.create(user_params)
                if @user.save!
                    session[:user_id] = @user.id
                    render json: UserSerializer.new(@user)
                else
                    render json: {errors: @user.errors.full_messages}
                end
            end
        end


 


   private 

   def user_params
    params.require(:user).permit(:username, :password)
   end
end

