class User < ApplicationRecord
    has_many :gardens
    has_many :plants, through: :gardens
    has_many :plots
    has_many :plants, through: :plots
    has_secure_password
    #remember to add validations(require name etc) before completing
end
