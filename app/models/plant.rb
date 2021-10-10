class Plant < ApplicationRecord
    has_many :gardens
    has_many :users, through: :gardens
    validates :name, :description, presence: true

    def self.sort_names
        order(:name)
    end

end
