class User < ApplicationRecord
    has_many :gardens
    has_many :plants, through: :gardens
    has_secure_password
    validates :email, uniqueness: true
    validates :name, :email, presence: true

end
