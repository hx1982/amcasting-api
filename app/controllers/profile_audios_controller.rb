class ProfileAudiosController < ApplicationController
  before_action :set_profile, only: [:index]
  before_action :set_profile_audio, only: [:update, :destroy]
  def index
    audios = @profile_audios
      .joins(artist_medium: [{medium: :medium_detail}])
      .order(:sequence)
    json_response({
        profile_audio: audios.select("
          profile_audios.id, media.id as medium_id, media.file_path, media.file_name, media.file_type, media.duration,
          artist_media.id as artist_medium_id, medium_details.id as medium_detail_id,
          profile_audios.is_primary, profile_audios.profile_id, profile_audios.sequence,
          'AUD' as medium_type_code
        "),
        medium_detail: audios.select('
          medium_details.id, medium_details.title, medium_details.description, medium_details.created_at
        '),
    })
  end

  def create
    audio = ProfileAudio.create!(profile_audio_params)
    json_response({
        profile_audio: audio
    })
  end

  def update
    sequence_old = @profile_audio.sequence
    primary_old = @profile_audio.is_primary
    #change to primary
    if !primary_old and profile_audio_params[:is_primary]
      primary = ProfileAudio.where('profile_id = ? and is_primary = ?', profile_audio_params[:profile_id], true).first
      primary.update(:is_primary => false) if primary
    end
    @profile_audio.update(profile_audio_params)
  end

  def changeSort
    if params['sortData'].present?
      params['sortData'].each do |index, sort|
        ProfileAudio.find(sort[:id]).update(:sequence => sort[:sequence])
      end
    end
  end

  def destroy
    # TODO: transactions
    @profile = @profile_audio.profile
    pp @profile
    is_primary = @profile_audio.is_primary
    artist_medium_id = @profile_audio.artist_medium
    @profile_audio.destroy()
    #change first audio to primary
    if is_primary
      @profile_audios = @profile_audio.profile.profile_audio
      @profile_audios.order(:sequence).first.update!(:is_primary => true) if @profile_audios.length > 0
    end
    #remove media in credit resume
    ResumeTableMedium
      .joins(:resume_table => [{ :profile_resume => :profile }])
      .where('profiles.id = ? AND resume_table_media.artist_medium_id = ?', @profile.id, artist_medium_id)
      .delete_all()

    head :no_content
  end

  private

  def profile_audio_params
    params.require(:profile_audio).permit(:artist_medium_id, :sequence, :is_primary, :profile_id)
  end

  def set_profile
    @profile = Profile.find(params[:profile_id]) if params[:profile_id].present?
    @profile_audios = @profile.profile_audio if @profile
  end
  def set_profile_audio
    @profile_audio = ProfileAudio.find(params[:id]) if params[:id].present?
  end
end
