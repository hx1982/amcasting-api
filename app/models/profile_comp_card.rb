class ProfileCompCard < ApplicationRecord
  belongs_to :profile
  has_many :profile_comp_card_item
  has_many :profile_comp_card_photo

  #validation
  validates_presence_of :profile, :comp_card_type
end
