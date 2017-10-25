class ArtistTypesController < ApplicationController
  def index
    json_response({
        artist_type: ArtistType.all
    })
  end
end
