class Garden < ApplicationRecord
    belongs_to :user
    belongs_to :plant
    # validates :address, presence: true
    accepts_nested_attributes_for :plant

      def plant_attributes=(attributes)
        if !attributes["name"].nil?
            plant = Plant.find_or_create_by(attributes)
            self.plant = plant
            self.plant.save
        end
      end
    
end
