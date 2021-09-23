class ApplicationController < ActionController::API
  
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def authenticate
        redirect_to '/api/v1/users' unless logged_in?
    end
    
end
