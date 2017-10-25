class ProfileArtistType < ApplicationRecord
  belongs_to :profile
  belongs_to :artist_type

  #vaiidation
  validates_presence_of :profile, :artist_type,
    :sequence
end
