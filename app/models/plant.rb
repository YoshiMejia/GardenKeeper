class Plant < ApplicationRecord
    has_many :gardens
    has_many :users, through: :gardens
    has_many :plots
    has_many :users, through: :plots
end
