class SessionsController < ApplicationController
    #site main page
    def main
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id    
            redirect_to homepage_path
        else
            redirect_to login_path, alert: "Invalid entry, please try again."
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
     end
end