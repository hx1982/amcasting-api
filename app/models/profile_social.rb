class ProfileSocial < ApplicationRecord
  belongs_to :profile
  belongs_to :social_type
  #validtaion
  validates_presence_of :profile, :social_type, :link
end
