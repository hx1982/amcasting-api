class ProfileAudio < ApplicationRecord
  belongs_to :profile
  belongs_to :artist_medium

  #validation
  validates_presence_of :profile, :artist_medium

end
