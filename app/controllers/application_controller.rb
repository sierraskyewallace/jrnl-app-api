class ApplicationController < ActionController::API
      before_action :authorized

 

   def current_user
    
    end
  

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please Login' }, status: :unauthorized unless logged_in?
  end
end
