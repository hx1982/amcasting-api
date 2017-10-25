class ProfileItem < ApplicationRecord
  belongs_to :profile
  belongs_to :profile_item_type
  has_many :profile_item_value, dependent: :destroy
  #validation
  validates_presence_of :profile, :profile_item_type
end
