class UsersController < ApplicationController 

    #Register
   def create 
   end

   #Login
   def login
   end

   private 

   def user_params
    params.require(:user).permit(:username, :password)
   end
end
