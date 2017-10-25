class ProfileCompCardItem < ApplicationRecord
  belongs_to :profile_comp_card
  belongs_to :profile_item_type

  #validation
  validates_presence_of :profile_comp_card,
    :profile_item_type, :sequence
end
