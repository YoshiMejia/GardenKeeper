class PlantsController < ApplicationController 
    def new
        @plant = Plant.new
        #should i add hidden_field to assign user to plant?
        #maybe add conditional, so if there is a user_id, then assign to the plant via hidden field.
    end

    def index
    end
    
    def create
        @plant = Plant.new(plant_params)
        if @plant.save
            redirect_to plant_path(@plant)
        else
            redirect_to new_plant_path
        end
        # redirect_to garden_path(@plant.garden)
        #make sure @plant.garden gives its correct garden
    end

    private
    def plant_params
        params.require(:plant).permit(:name, :description)
    end
end