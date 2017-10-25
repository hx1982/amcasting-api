class ProfileCompCardPhoto < ApplicationRecord
  belongs_to :profile_comp_card
  belongs_to :profile_photo

  #validation
  validates_presence_of :profile_photo, :profile_comp_card,
    :sequence
end
