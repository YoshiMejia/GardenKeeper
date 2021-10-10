class PlantsController < ApplicationController 
    before_action :redirect_if_not_logged_in

    def index
        @plants = Plant.all
    end
    
    def show
        @plant = Plant.find(params[:id])
    end

    def celebrity
        @celebrity = Plant.celebrity
    end

end