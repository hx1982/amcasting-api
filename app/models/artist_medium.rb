class ArtistMedium < ApplicationRecord
  belongs_to :artist
  belongs_to :medium, dependent: :destroy

  #validation
  validates_presence_of(:artist, :medium)
end
