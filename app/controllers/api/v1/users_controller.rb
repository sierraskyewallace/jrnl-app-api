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
            ## check if user is already in the database
            @user = User.find_by(email: params[:user][:email])
            if @user && @user.valid_password?(params[:user][:password])
                session[:user_id] = @user.id

                render json: UserSerializer.new(@user), status: :accepted

            else
            @user = User.create(user_params)
            if @user.save
                session[:user_id] = @user.id
                render json: UserSerializer.new(@user), status: :created
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