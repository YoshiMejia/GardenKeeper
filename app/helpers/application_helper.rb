module ApplicationHelper
    def logged_in?
        !!session[:user_id]
    end

    # def no_data?
    #     @user = User.find_by(id: session[:user_id])
    #     !!@user.garden || !!@user.plants || !!@user.plots
    # end
end
