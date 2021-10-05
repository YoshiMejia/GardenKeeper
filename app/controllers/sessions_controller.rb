class SessionsController < ApplicationController
    def home
    end

    def new
        @user = User.new
    end

    def create
        byebug
        @user = User.find_by(name: params[:name])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id    
        redirect_to homepage_path
    end

    def destroy
        session.delete :user_id
        redirect_to login_path
     end
end