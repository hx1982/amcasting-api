class ProfileVideosController < ApplicationController
  before_action :set_profile, only: [:index]
  before_action :set_profile_video, only: [:update, :destroy]
  def index
    videos = @profile_videos
      .joins(artist_medium: [{medium: :medium_detail}])
      .order(:sequence)
    json_response({
        profile_video: videos.select("
          profile_videos.id, media.id as medium_id, media.file_path, media.file_name, media.file_type, media.duration,
          artist_media.id as artist_medium_id, medium_details.id as medium_detail_id,
          profile_videos.is_primary, profile_videos.profile_id, profile_videos.sequence,
          'VID' as medium_type_code
        "),
        medium_detail: videos.select('
          medium_details.id, medium_details.title, medium_details.description, medium_details.created_at
        '),
    })
  end

  def create
    video = ProfileVideo.create!(profile_video_params)
    json_response({
        profile_video: video
    })
  end

  def update
    sequence_old = @profile_video.sequence
    primary_old = @profile_video.is_primary
    #change to primary
    if !primary_old and profile_video_params[:is_primary]
      primary = ProfileVideo.where('profile_id = ? and is_primary = ?', profile_video_params[:profile_id], true).first
      primary.update(:is_primary => false) if primary
    end
    @profile_video.update(profile_video_params)
  end

  def changeSort
    if params['sortData'].present?
      params['sortData'].each do |index, sort|
        ProfileVideo.find(sort[:id]).update(:sequence => sort[:sequence])
      end
    end
  end

  def destroy
    # TODO: transactions
    @profile = @profile_video.profile
    pp @profile
    is_primary = @profile_video.is_primary
    artist_medium_id = @profile_video.artist_medium
    @profile_video.destroy()
    #change first video to primary
    if is_primary
      @profile_videos = @profile_video.profile.profile_video
      @profile_videos.order(:sequence).first.update!(:is_primary => true) if @profile_videos.length > 0
    end
    #remove media in credit resume
    ResumeTableMedium
      .joins(:resume_table => [{ :profile_resume => :profile }])
      .where('profiles.id = ? AND resume_table_media.artist_medium_id = ?', @profile.id, artist_medium_id)
      .delete_all()

    head :no_content
  end

  private

  def profile_video_params
    params.require(:profile_video).permit(:artist_medium_id, :sequence, :is_primary, :profile_id)
  end

  def set_profile
    @profile = Profile.find(params[:profile_id]) if params[:profile_id].present?
    @profile_videos = @profile.profile_video if @profile
  end
  def set_profile_video
    @profile_video = ProfileVideo.find(params[:id]) if params[:id].present?
  end
end
