class PlantsController < ApplicationController 
    def new
        @plant = Plant.new
        #should i add hidden_field to assign user to plant?
        #maybe add conditional, so if there is a user_id, then assign to the plant via hidden field.
    end

    def create
        byebug
        @plant = Plant.new(plant_params)
        redirect_to 
    end

    private
    def plant_params
        params.require(:plant).permit(:name, :description)
    end
end