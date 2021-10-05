class User < ApplicationRecord
    has_many :gardens
    has_many :plants, through: :gardens
    has_many :plots
    has_many :plants, through: :plots
end
