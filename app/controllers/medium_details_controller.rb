class MediumDetailsController < ApplicationController
  before_action :set_medium_detail, only: [:update]
  def index
    if params['artist_medium_id'].present?
      artist_medium =  ArtistMedium
        .joins(medium: [:medium_detail, :medium_type])
        .find(params['artist_medium_id'])
      json_response({
          medium_detail: {
              id: artist_medium.medium.medium_detail.id,
              title: artist_medium.medium.medium_detail.title,
              description: artist_medium.medium.medium_detail.description,
              medium_type_code: artist_medium.medium.medium_type.code,
              created_at: artist_medium.medium.medium_detail.created_at.to_formatted_s(:db)
          }
      })
    end
  end

  def update
    @medium_detail.update(medium_params)
  end

  private

  def medium_params
    params.require(:medium_detail).permit(:title, :description)
  end

  def set_medium_detail
    @medium_detail = MediumDetail.find(params[:id]) if params[:id].present?
  end
end
