class Api::V1::UsersController < Devise::RegistrationsController
    
      def index 
            @users = User.all 
        end
  
def new
    @user = User.new 
end


 def create 
    @user = User.find_by(email: user_params[:email])
    if @user && @user.valid_password?(user_params[:password])
        sign_in @user
      #session[:user_id] = @user.id
      render json:  UserSerializer.new(@user), status: :created
    elsif
        @user = User.new(user_params)
        if @user.save!
            sign_in @user
            #session[:user_id] = @user.id
            render json: UserSerializer.new(@user), status: :created
        end
    else
        render json: { message: "Error" }, status: :unprocessable_entity
    end
end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end