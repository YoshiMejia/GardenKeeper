class Garden < ApplicationRecord
    belongs_to :user
    has_many :plants
    has_many :plots
    has_many :plants, through: :plots
end
