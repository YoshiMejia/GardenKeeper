class Garden < ApplicationRecord
    belongs_to :user
    has_many :plants
    has_many :plots
    has_many :plants, through: :plots
    accepts_nested_attributes_for :plants, :plots
end
