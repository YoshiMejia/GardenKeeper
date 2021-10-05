class GardensController < ApplicationController 
    def new
        @garden = Garden.new
    end

    def create
        byebug
    end

    def show
        #check params for whats getting passed in
    end

    private
    def garden_params
        
    end
end