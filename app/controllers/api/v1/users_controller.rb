class Api::V1::UsersController < Devise::RegistrationsController

    
      def index 
            @users = User.all 
            render json: UserSerializer.new(@users)

        end
        def new 
            @user = User.new
            render json: UserSerializer.new(@user)
        end


       def create 
            ## check if user is already in the database and passwor matches

            @user = User.find_by(email: params[:user][:email])
            if @user && @user.valid_password?(params[:user][:password])
                render json: UserSerializer.new(@user)
            else
                @user = User.new(user_params)
                if @user.save
                    render json: UserSerializer.new(@user)
                else
                    render json: {errors: @user.errors.full_messages}
                end
            end
        end



    


    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end

end