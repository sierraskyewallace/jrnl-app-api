class Api::V1::UsersController < ApplicationController 

        def index 
            @users = User.all 
            render json: UserSerializer.new(@users)
        end
  
        def create
            ## check if user already exists and password matches and log in
            @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                render json: UserSerializer.new(@user)
            else
                ## create new user
                @user = User.new(user_params)
                if @user.save!
                    render json: UserSerializer.new(@user)
                else
                    render json: {error: @user.errors.full_messages}
                end
            end
        end


            def login 
                @user = User.find_by(username: params[:username])
                if @user && @user.authenticate(params[:password])
                    render json: UserSerializer.new(@user)
                else
                    render json: {error: "User not found"}
                end
            end


 


   private 

   def user_params
    params.require(:user).permit(:username, :password)
   end
end

