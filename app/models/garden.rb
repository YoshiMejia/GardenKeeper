class Garden < ApplicationRecord
    belongs_to :user
    belongs_to :plant
    validates :address, presence: true
    validates :plant, uniqueness: {scope: :address, message: "error: You already have this plant saved at this address!" }
    accepts_nested_attributes_for :plant, reject_if: proc { |attributes| attributes['name'].blank? }
    
    # def self.busy_bee
    #     joins(:user).group(:id).order('avg(plant_id) desc')
    #     # includes(plant: :name).where('COUNT(*)<1')
    # end

    # def self.celebrity
    #     Plant.joins(:gardens).group(:user_id).limit(1)
    # end

#     # this one returns gardens with busy bee users in order 
#     Garden.joins(:plant).group(:user_id).having('COUNT(user_id)>1')
#     [#<Garden:0x00007fbe45237570
#   id: 6,
#   address: "yonkers",
#   user_id: 4,
#   plant_id: 2,
#   created_at: Sun, 10 Oct 2021 00:53:14.344648000 UTC +00:00,
#   updated_at: Sun, 10 Oct 2021 00:53:14.344648000 UTC +00:00>,
#  #<Garden:0x00007fbe452374a8
#   id: 10,
#   address: "timbuktu",
#   user_id: 5,
#   plant_id: 3,
#   created_at: Sun, 10 Oct 2021 03:10:34.148952000 UTC +00:00,
#   updated_at: Sun, 10 Oct 2021 03:10:34.148952000 UTC +00:00>,
#  #<Garden:0x00007fbe452373e0
#   id: 12,
#   address: "texas",
#   user_id: 7,
#   plant_id: 1,
#   created_at: Sun, 10 Oct 2021 16:33:41.715051000 UTC +00:00,
#   updated_at: Sun, 10 Oct 2021 16:33:41.715051000 UTC +00:00>]


# # celebrity plants in order from most users
# Plant.joins(:gardens).group(:user_id).having('COUNT(user_id)>1')

# Plant.joins(:gardens).group(:id).having('COUNT(plant_id)>1').order('COUNT(user_id) desc')



end
