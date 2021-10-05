class ApplicationController < ActionController::Base

    #helpers not currently working
helpers do
    def logged_in?
        !!session[:user_id]
    end
end
end
