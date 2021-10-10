class SessionsController < ApplicationController
    #site main page
    def main
    end

    def new
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
    
    def omniauth
        @user = User.google_user(auth)
        session[:user_id] = @user.id    
        redirect_to homepage_path
    end
    

    def destroy
        session.delete :user_id
        redirect_to root_path
     end


     private

     def auth
        request.env['omniauth.auth']
     end
end