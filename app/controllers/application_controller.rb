class ApplicationController < ActionController::API
    


    def logged_in?
        !!current_user
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def authenticate
        if !logged_in?
            render json: { error: "Please log in" }
        end

    end
    
end
