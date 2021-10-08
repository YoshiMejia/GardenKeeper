class Garden < ApplicationRecord
    belongs_to :user
    belongs_to :plant
    validates :address, presence: true
    
end
