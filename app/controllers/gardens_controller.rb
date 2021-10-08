class GardensController < ApplicationController 
    def new
        @garden = Garden.new(user_id: session[:user_id])
        @garden.build_plant
    end

    def create
        @garden = Garden.new(garden_params)
        if @garden.save
            redirect_to user_garden_path(@garden.user, @garden)
        else
            redirect_to new_garden_path
        end
    end

    def show
        @garden = Garden.find(params[:id])
    end

    def index
        @garden = Garden.where(user_id: params[:user_id])
    end

    def destroy
        Garden.find(params[:id]).destroy
        redirect_to user_gardens_path(current_user)
    end

    private
    def garden_params
        params.require(:garden).permit(:user_id, :address, plant_attributes: [:name, :description])
    end

end#class ender