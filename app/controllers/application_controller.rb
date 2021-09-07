class ApplicationController < ActionController::API
    
    #check is user is current user
    def current_user
    end

    #check if user is logged in
    def logged_in?
    end

    #make sure currrent user is auth for page or action
    def authorize 
    end

end
