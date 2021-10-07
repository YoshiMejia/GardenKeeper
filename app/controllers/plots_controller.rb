class PlotsController < ApplicationController 
    # belongs_to :plant
    # belongs_to :user
    # belongs_to :garden
    
    def new
        @plot = Plot.new(user_id: session[:user_id])
    end

    def create
        byebug
#         #(byebug) @plot = Plot.new(plot_params)
# #<Plot id: nil, vegetation_type: "sada", plant_id: nil, user_id: nil, garden_id: nil, created_at: nil, updated_at: nil>
# (byebug) @plot.save!
# *** ActiveRecord::RecordInvalid Exception: Validation failed: Plant must exist, User must exist, Garden must exist
# figure out way to carry over ID's so that plot can save to DB


        @plot = Plot.new(plot_params)
        if @plot.save
            byebug
            # redirect_to plot_path(@plot)
            redirect_to garden_plots_path
        else
            redirect_to new_plot_path
        end
    end

    def index
        @plots = Plot.all
    end

    def show
        @plot = Plot.find(params[:id])
    end
    
    private

    def plot_params
        params.require(:plot).permit(:user_id, :vegetation_type)
    end
end