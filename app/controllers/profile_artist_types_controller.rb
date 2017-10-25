class ProfileArtistTypesController < ApplicationController
  before_action :set_profile, only: [:index]
  before_action :set_profile_artist_type, only: [:update, :destroy]

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

  def create
    duplicateChecking()
    result = ProfileArtistType.create!(profile_artist_type_param)
    json_response({
        profile_artist_type: result
    })
  end

  def update
    duplicateChecking()
    @profile_artist_type.update(profile_artist_type_param)
    head :no_content
  end

  def destroy
    @profile_artist_type.destroy()
    head :no_content
  end

  private
  def duplicateChecking
    count = ProfileArtistType
      .where('profile_id = ? and artist_type_id= ? and id != ?', profile_artist_type_param[:profile_id],
        profile_artist_type_param[:artist_type_id], params[:id] || 0 )
      .count
    raise(ExceptionHandler::RecordDuplidation, Message.duplication_record) if count > 0
  end
  def profile_artist_type_param
    params.require(:profile_artist_type).permit(:is_primary, :profile_id, :sequence, :artist_type_id)
  end

  def set_profile_artist_type
    @profile_artist_type = ProfileArtistType.find(params[:id]) if params[:id]
  end

  def set_profile
    @profile = Profile.find(params[:profile_id]) if params[:profile_id]
  end
end
