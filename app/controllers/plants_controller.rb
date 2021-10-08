class PlantsController < ApplicationController 
    def new
        @plant = Plant.new
    end

    def index
        @plants = Plant.all
    end
    
    def show
        @plant = Plant.find(params[:id])
    end

    def create
        @plant = Plant.find_or_create_by(plant_params)
        if @plant.save
            @plant.users << current_user
            redirect_to user_plant_path(current_user, @plant)
        else
            redirect_to new_plant_path
        end
    end

#     def destroy
# #<%= button_to "Delete plant", user_plant_path(current_user, @plant), method: :delete %><br><br>
#         Plant.find(params[:id]).destroy
#         redirect_to user_gardens_path(current_user)
#     end
    
    private
    def plant_params
        params.require(:plant).permit(:name, :description)
    end
end