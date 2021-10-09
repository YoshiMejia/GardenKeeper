class Plant < ApplicationRecord
    has_many :gardens
    has_many :users, through: :gardens
    validates :name, :description, presence: true

end
