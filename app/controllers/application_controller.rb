class ApplicationController < ActionController::API



    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def authenticate
	    unless logged_in?
	      render json: { message: 'Please log in' }, status: :unauthorized
    	end
    end
    
end
