class UsersController < ApplicationController 
    def new
        @user = User.new
    end
    
    #users home page
    def home
    end

    def create
        @user = User.new(user_params)
        #if youre able to save the user, login and render homepage
        if @user.save
            session[:user_id] = @user.id
            redirect_to homepage_path
        else
            #else render login again
            redirect_to signup_path, alert: "Wrong password, try again"
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)    
    end
end #class ender