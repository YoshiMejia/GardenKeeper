class PlotsController < ApplicationController 
    # belongs_to :plant
    # belongs_to :user
    # belongs_to :garden
    
    def new
        @plot = Plot.new
    end

    def create
        @plot = Plot.new(plot_params)
        redirect_to garden_plots_path
    end
    
    private

    def plot_params
        params.require(:plot).permit(:user_id, :vegetation_type)
    end
end