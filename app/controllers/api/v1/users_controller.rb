class Api::V1::UsersController < ApplicationController

    def index 
        users = User.all
        options = {
            include: [:journal_entries]
        }

        render json: UserSerializer.new(users, options)

    end

    def create 
        user = User.new(user_params)
        if user.save
            render json: user, status: :created
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username)
    end
end
