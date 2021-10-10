class Plant < ApplicationRecord
    has_many :gardens
    has_many :users, through: :gardens
    validates :name, :description, presence: true
    validates_uniqueness_of :name, :case_sensitive => false
    
    scope :celebrity, -> {joins(:gardens).group(:id).having('COUNT(plant_id)>=1').order('COUNT(user_id) desc')}

    def self.sort_names
        order(:name)
    end

end
