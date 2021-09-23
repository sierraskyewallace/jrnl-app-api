class Api::V1::UsersController < Devise::RegistrationsController
    #skip_before_action :authenticate_user!


    
      def index 
            @users = User.all 
            render json: UserSerializer.new(@users)

        end
        def new 
            @user = User.new
            render json: UserSerializer.new(@user)
        end


       def create 
            



    


    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

end