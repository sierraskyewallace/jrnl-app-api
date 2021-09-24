class Api::V1::UsersController < ApplicationController 

        def index 
            @users = User.all 
            render json: UserSerializer.new(@users)
        end

        def new
            @user = User.new
        end

  
        def create
            ## check if user already exists and password matches and log in
            @user = User.find_by(username: user_params[:username])
            if @user && @user.authenticate(user_params[:password])
                session[:user_id] = @user.id
                render json: UserSerializer.new(@user)
            else
                ## create new user
                @user = User.new(user_params)
                if @user.save!
                    session[:user_id] = @user.id
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

