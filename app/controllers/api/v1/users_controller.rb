class Api::V1::UsersController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    resource.save
    render_resource(resource)
  end

  def update
    if current_user.update(user_params)
      render_resource(current_user)
    else
      render json: { errors: current_user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end