class Profile < ApplicationRecord
  belongs_to :artist
  belongs_to :agency
  has_many :profile_audio
  has_many :profile_video
  has_many :profile_photo
  has_many :profile_skill
  has_many :profile_artist_type
  has_many :profile_social
  has_many :profile_item
  has_one :profile_comp_card
  has_one :profile_resume
  #validation
  validates_presence_of :artist, :is_billing_profile,
    :is_active
end
