class Plant < ApplicationRecord
    has_many :gardens
    has_many :users, through: :gardens
    validates :name, :description, presence: true

    def self.sort_names
        order(:name)
    end

    def self.celebrity
        joins(:gardens).group(:id).having('COUNT(plant_id)>=1').order('COUNT(user_id) desc')
    end

end
