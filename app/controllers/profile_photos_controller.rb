class ProfilePhotosController < ApplicationController
  before_action :set_profile, only: [:index]
  before_action :set_profile_photo, only: [:update, :destroy]
  def index
    photos = @profile_photos
      .joins(artist_medium: [{medium: :medium_detail}])
      .order(:sequence)
    json_response({
        profile_photo: photos.select("
          profile_photos.id, media.id as medium_id, media.file_path, media.file_name, media.file_type, media.duration,
          artist_media.id as artist_medium_id, medium_details.id as medium_detail_id,
          profile_photos.is_primary, profile_photos.profile_id, profile_photos.sequence,
          'PHOT' as medium_type_code
        "),
        medium_detail: photos.select('
          medium_details.id, medium_details.title, medium_details.description, medium_details.created_at
        '),
    })
  end

  def create
    photo = ProfilePhoto.create!(profile_photo_params)
    json_response({
        profile_photo: photo
    })
  end

  def update
    sequence_old = @profile_photo.sequence
    primary_old = @profile_photo.is_primary
    #change to primary
    if !primary_old and profile_photo_params[:is_primary]
      primary = ProfilePhoto.where('profile_id = ? and is_primary = ?', profile_photo_params[:profile_id], true).first
      primary.update(:is_primary => false) if primary
    end
    @profile_photo.update(profile_photo_params)
  end

  def changeSort
    if params['sortData'].present?
      params['sortData'].each do |index, sort|
        ProfilePhoto.find(sort[:id]).update(:sequence => sort[:sequence])
      end
    end
  end

  def destroy
    # TODO: transactions
    @profile = @profile_photo.profile
    pp @profile
    is_primary = @profile_photo.is_primary
    artist_medium_id = @profile_photo.artist_medium
    @profile_photo.destroy()
    #change first photo to primary
    if is_primary
      @profile_photos = @profile_photo.profile.profile_photo
      @profile_photos.order(:sequence).first.update!(:is_primary => true) if @profile_photos.length > 0
    end
    #remove media in credit resume
    ResumeTableMedium
      .joins(:resume_section => [{ :profile_resume => :profile }])
      .where('profiles.id = ? AND resume_table_media.artist_medium_id = ?', @profile.id, artist_medium_id)
      .delete_all()

    #remove media in comp card
    ProfileCompCardPhoto
      .joins(:profile_comp_card => [ :profile])
      .where('profiles.id = ? AND profile_comp_card_photos.profile_photo_id = ?', @profile.id, @profile_photo.id)
      .delete_all()

    head :no_content
  end

  private

  def profile_photo_params
    params.require(:profile_photo).permit(:artist_medium_id, :sequence, :is_primary, :profile_id)
  end

  def set_profile
    @profile = Profile.find(params[:profile_id]) if params[:profile_id].present?
    @profile_photos = @profile.profile_photo if @profile
  end
  def set_profile_photo
    @profile_photo = ProfilePhoto.find(params[:id]) if params[:id].present?
  end
end
