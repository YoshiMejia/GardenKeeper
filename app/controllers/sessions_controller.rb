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
            flash[:error] = "Invalid entry, please try again."
            redirect_to login_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
     end
end