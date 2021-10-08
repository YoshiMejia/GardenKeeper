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

    def destroy
        Plant.find(params[:id]).destroy

    end
    
    private
    def plant_params
        params.require(:plant).permit(:name, :description)
    end
end