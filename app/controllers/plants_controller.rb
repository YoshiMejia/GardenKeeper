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
        @plant = Plant.new(plant_params)
        if @plant.save
            redirect_to plant_path(@plant)
        else
            redirect_to new_plant_path
        end
    end

    private
    def plant_params
        params.require(:plant).permit(:user_id, :name, :description)
    end
end