class ArtistMediaController < ApplicationController
  before_action :set_artist, only: [:index]
  before_action :set_medium, only: [:show, :update, :destroy]

  def index
    #medium_type_code
    @artist_media = @artist.artist_medium.joins(medium: [:medium_type, :medium_detail]);
    if search_params[:medium_type_code].present?
      codes = search_params[:medium_type_code].split(',').map(&:to_s)
      @artist_media = @artist_media
        .order(:sequence)
        .where('medium_types.code in (?)', codes)
    end
    #if search_params[:medium_type_code].present?
    #key word search
    if search_params[:key_word].present?
      key_word = search_params[:key_word]
      @artist_media = @artist_media.where('medium_details.title like ? or medium_details.description like ?', "%#{key_word}%", "%#{key_word}%")
    end
    #order by and sort by
    if search_params[:order_by].present?
      if search_params[:order_by] == 'first_uploaded'
        @artist_media = @artist_media.order(created_at: :asc)
      elsif search_params[:order_by] == 'last_uploaded'
        @artist_media = @artist_media.order(created_at: :desc)
      elsif search_params[:order_by] == 'a-z'
        @artist_media = @artist_media.order('medium_details.title asc')
      elsif search_params[:order_by] == 'z-a'
        @artist_media = @artist_media.order('medium_details.title desc')
      else
        @artist_media = @artist_media.order(created_at: :asc)
      end
    else
      @artist_media = @artist_media.order(created_at: :desc)
    end
    #paganation
    json_response({
        artist_medium: @artist_media.select('
          artist_media.id, media.id as medium_id, media.file_path, media.file_name, media.file_type, media.duration,
          medium_details.id as medium_detail_id,
          medium_types.code as medium_type_code
        '),
        medium_detail: @artist_media.select('
          medium_details.id, medium_details.title, medium_details.description, medium_details.created_at
        '),
    })
  end

  def show
    json_response(@medium.to_json(:include => [:medium_detail => {:include => :audio_detail}]))
  end

  def create

  end

  def update
    if @medium.medium_detail.nil?
      @medium.create_medium_detail!(media_detail_params)
    else
      @medium.medium_detail.update!(media_detail_params)
    end
    if @medium.medium_type.code == 'AUD'
      if @medium.medium_detail.audio_detail.nil?
        @medium.medium_detail.create_audio_detail!(audio_detail_params)
      else
        @medium.medium_detail.audio_detail.update!(audio_detail_params)
      end
    end

    json_response(@medium.to_json(:include => [:medium_detail => {:include => :audio_detail}]))
  end

  def destroy
    @artist_medium.destroy()
    head :no_content
  end


  private
  def search_params
    params.permit(:medium_type_code, :page_size, :page_index, :order_by ,:key_word)
  end

  def media_detail_params
    params.permit(:title, :description)
  end

  def audio_detail_params
    params.permit(:gender_code, :age_from, :age_to, :styles)
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_medium
    @artist_medium = ArtistMedium.find(params[:id]) if params[:id].present?
    @medium = @artist_medium.medium if @artist_medium
  end
end
