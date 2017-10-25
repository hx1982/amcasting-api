class ArtistPackage < ApplicationRecord
  belongs_to :package
  belongs_to :artist
end
