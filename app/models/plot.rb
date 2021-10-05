class Plot < ApplicationRecord
    belongs_to :plant
    belongs_to :user
    belongs_to :garden
end
