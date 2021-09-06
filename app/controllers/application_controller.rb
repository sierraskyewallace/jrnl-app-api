class ApplicationController < ActionController::API
      before_action :authorized
      ## include current_user as a helper 
      #helper_method :current_user
      



 def current_user
  current_user ||= User.find_by(session[:id]) if session[:id]
 end

  

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please Login' }, status: :unauthorized unless logged_in?
  end
end
