class GardensController < ApplicationController 
    def new
        @garden = Garden.new(user_id: current_user.id)
        @garden.build_plant
    end

    def create
        @garden = Garden.new(garden_params)
        if @garden.save
            redirect_to user_garden_path(@garden.user, @garden)
        else
            render :new
        end
    end

    def show
        @garden = Garden.find(params[:id])
    end

    def busybee
        @busy_bee = Garden.busy_bee
    end 

    def index
        if params[:user_id]
            @gardens = Garden.where(user_id: params[:user_id])
        else
            @gardens = Garden.all.where.not(user_id: current_user.id)
        end
    end

    def destroy
        Garden.find(params[:id]).destroy
        redirect_to user_gardens_path(current_user)
    end

    private
    def garden_params
        params.require(:garden).permit(:user_id, :address, :plant_id, plant_attributes: [:name, :description])
    end

end#class ender