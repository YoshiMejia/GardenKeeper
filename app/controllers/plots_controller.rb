class PlotsController < ApplicationController 
    # belongs_to :plant
    # belongs_to :user
    # belongs_to :garden
    
    def new
        @plot = Plot.new
    end

    def create
        @plot = Plot.new(plot_params)
        if @plot.save
            # redirect_to plot_path(@plot)
            redirect_to garden_plots_path
        else
            redirect_to new_plot_path
        end
    end
    
    private

    def plot_params
        params.require(:plot).permit(:user_id, :vegetation_type)
    end
end