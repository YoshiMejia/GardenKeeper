class UsersController < ApplicationController 
    def new
        @user = User.new
    end
    
    def create
        # byebug
        # creates a new user
        @user = User.new(user_params)
        if @user.password != user_params[:password_confirmation]
            # redirects you if your password and confirmation don't match
            redirect_to new_user_path, alert: "Wrong password"
        else
            # logs you in
            # sets your password if the confirmation matches
            session[:user_id] = @user.id
            redirect_to homepage_path
        end 
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)    
    end
end #class ender