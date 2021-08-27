class Api::V1::UsersController < ApplicationController

    def index 
        users = User.all
        #options = {
         #   include: [:journal_entries]
        #}
        render json: UserSerializer.new(users)

    end

    def create 
        user = User.new(user_params)
        if user.save
            render json: { user: UserSerializer.new(user) }, status: :created
        else
            render json: { error: "Username is already taken" }, status: :not_acceptable
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username)
    end
end
