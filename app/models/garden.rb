class Garden < ApplicationRecord
    belongs_to :user
    belongs_to :plant
    validates :address, presence: true
    accepts_nested_attributes_for :plant, reject_if: proc { |attributes| attributes['name'].blank? }
    
end
