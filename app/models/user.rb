class User < ApplicationRecord
    has_many :gardens
    has_many :plants, through: :gardens
    has_secure_password
    validates :email, uniqueness: true
    validates :name, :email, presence: true

    def self.google_user(auth)
        find_or_create_by(email: auth[:info][:email]) do |u|
            u.name = auth[:info][:name] 
            u.email = auth[:info][:email] 
            u.password = SecureRandom.hex
        end
    end

end
