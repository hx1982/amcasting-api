class ArtistCity < ApplicationRecord
  belongs_to :artist
  belongs_to :city

  attribute :city_full_name, :string
  #validation
  validates_presence_of(:artist, :city)

  def city_full_name
    @city = self.city
    @state = self.city.state
    @country = self.city.state.country
    "#{@country.name}, #{@state.name}, #{@city.name}"
  end
end
