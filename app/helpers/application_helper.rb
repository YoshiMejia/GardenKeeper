module ApplicationHelper
    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def nested_route?
        !!params[:user_id]
    end
    
    #helper to see other users plants aka Plant.all without current users plants
    #to be used in the gardens/new collection
    def other_plants
     plants = current_user.plants
        plants.map do |p|
        @other_plants = Plant.where.not(name: p.name)
    end
    @other_plants
    end

    # def no_data?
    #     @user = User.find_by(id: session[:user_id])
    #     !!@user.garden || !!@user.plants || !!@user.plots
    # end
end
