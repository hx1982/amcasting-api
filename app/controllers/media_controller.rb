class MediaController < ApplicationController
  before_action :set_medium, only: [:show, :update, :destroy]

  def create
    if medium_params[:asset].present? and
        medium_params[:profile_id].present?
      #1. create medium
      guid = 	UUIDTools::UUID.random_create.to_s
      m = Medium.new
      m.asset = medium_params[:asset]
      m.medium_type = MediumType.find_by(:code => medium_params[:medium_type_code])
      m.file_path = "#{guid[0..1]}\\#{guid[2..3]}\\#{guid[4..5]}"
      m.file_name = guid
      m.file_type = 'png' if medium_params[:medium_type_code] == 'PHOT'
      m.file_type = 'mp3' if medium_params[:medium_type_code] == 'AUD'
      m.file_type = 'mp4' if medium_params[:medium_type_code] == 'VID'
      m.save!
      #2. create medium detail
      m_detail = MediumDetail.create!({
        title: remove_file_extension(medium_params[:asset].original_filename),
        description: '',
        medium_id: m.id
      })
      #3. create artist medium
      profile = Profile.find(medium_params[:profile_id])
      artist_medium = ArtistMedium.create!({
          :artist_id => profile.artist.id,
          :medium_id => m.id,
      })
      transcode(m) if MediaTranscoder.supported_media_type?(m)
    end
  end

private
  def set_medium
    @medium = Medium.find(params[:id])
  end

  def medium_params
    params.require(:medium).permit(:asset, :profile_id, :medium_type_code)
  end

  def remove_file_extension(filename)
    File.basename(filename,File.extname(filename))
  end

  def transcode(medium)
    MediaTranscoder.new(
      medium,
      Rails.application.secrets[:aws_transcoder_region],
      Rails.application.secrets[:aws_transcoder_media_pipeline]
    ).transcode
  end

end
