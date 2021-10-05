class GardensController < ApplicationController 
    def new
        @garden = Garden.new
    end

    def create
        @garden = Garden.new(garden_params)
        redirect_to garden_path(@garden)
    end

    def show
        #check params for whats getting passed in
        byebug
        # @garden = Garden.find_by(id: )
    end

    def index
    end

    private
    def garden_params
        params.require(:garden).permit(:user_id, :address, :plants, :plots)
    end
end