class ArtistCitiesController < ApplicationController
  before_action :set_artist_city, only: [:show, :update, :destroy]
  def destroy
    @artist_city.destroy()
    head :no_content
  end

  def update
    @artist_city.is_primary = artist_city_params[:is_primary]
    @artist_city.save()
    head :no_content
    #json_response(@member_contact.to_json(:include => :contact), :ok)
  end

  def create
    @artist_city = ArtistCity.create!(artist_city_params)
    json_response({
      artist_city: @artist_city
    })
  end

  def artist_city_params
    params.require(:artist_city).permit(:artist_id, :city_id, :is_primary, :sequence)
  end

  def set_artist_city
    @artist_city = ArtistCity.find(params[:id]) if params[:id]
  end
end
