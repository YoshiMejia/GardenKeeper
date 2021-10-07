class Garden < ApplicationRecord
    belongs_to :user
    has_many :plants
    has_many :plots
    has_many :plants, through: :plots
    accepts_nested_attributes_for :plots, :plants

    # def plots_attributes=(plot)
    #   self.plots = Plot.find_or_create_by(vegetation_type: plot[:vegetation_type])
      
    #   Plot.find_or_create_by(vegetation_type: params.require(:garden).permit(plots_attributes: [:vegetation_type]))
    # end

end
