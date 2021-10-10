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
    @other_plants ||= Plant.all
    end

    def index_header
        if !!params[:user_id]
            content_tag(:h1, "Hey, #{current_user.name}! Here are your gardens.")
        else
            content_tag(:h1, "All Gardens")
        end
    end
    
    def display_owner(user)
         if user != current_user 
            content_tag(:p, "#{user.name} owns this plant.")
        end 
    end
end
