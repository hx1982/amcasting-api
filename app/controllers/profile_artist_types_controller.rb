class ProfileArtistTypesController < ApplicationController
  before_action :set_profile, only: [:index]

  def index
    json_response({
        profile_artist_type: @profile.profile_artist_type.
          joins(:artist_type)
          .order(:sequence)
          .select('profile_artist_types.id,artist_types.name,
          profile_artist_types.is_primary,profile_artist_types.sequence,profile_artist_types.profile_id,
          profile_artist_types.artist_type_id')
    })
  end

  def saveProfileArtistType
    if params[:artistTypes].present? and params[:profile_id].present?
      @profile= Profile.find(params[:profile_id])
      @profile.profile_artist_type.clear()
      params[:artistTypes].each do |index, artistType|
        if artistType[:id].present? and
          artistType[:sequence].present?
          @profile.profile_artist_type.create!({
            :artist_type_id => artistType[:id],
            :sequence => artistType[:sequence],
            :is_primary => artistType[:is_primary],
          });
        end
      end
    end
  end

  private
  def set_profile
    @profile = Profile.find(params[:profile_id]) if params[:profile_id]
  end
end
