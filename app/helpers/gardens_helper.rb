module GardensHelper
    #helper to see other users plants aka Plant.all without current users plants
    #to be used in the gardens/new collection
    def other_plants
        plants = current_user.plants
           plants.map do |p|
           @other_plants = Plant.where.not(name: p.name)
       end
       @other_plants ||= Plant.all
    end

    def display_owner(user)
        if user != current_user 
           content_tag(:p, "#{user.name} owns this plant.")
       end 
   end

   def delete_button(garden)
        if garden.user == current_user 
        (button_to "Delete this garden", user_garden_path(current_user, garden), method: :delete)
        end 
   end

    def index_header
        if !!params[:user_id] && current_user.gardens.empty?
            content_tag(:h1, "Hey, #{current_user.name}!") + content_tag(:h3, "Create a garden first, and then you'll see it here!")
        elsif !!params[:user_id] 
            content_tag(:h1, "Hey, #{current_user.name}! Here are your gardens.")
        else
            content_tag(:h1, "All Gardens")
        end
    end

    def last_garden
        recent_g = current_user.gardens.last
        recent_g.created_at
    end

end