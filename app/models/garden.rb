class Garden < ApplicationRecord
    belongs_to :user
    has_many :plants
    has_many :plots
    has_many :plants, through: :plots
    # accepts_nested_attributes_for :plants, :plots

    # def plants_attributes=(plants_attributes)
    #     self.plants = Plant.find_or_create_by(name: plants_attributes[:name], description: plants_attributes[:description]) unless plants_attributes[:name].blank?
    #   end
end
