class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :destroy]

  def index
    if params[:op].present? && params[:op] === 'queryBillingProfileByMember' && params[:member_id].present?
      queryBillingProfileByMember
    end
  end

  def show
    show_profile
  end

  private
  def queryBillingProfileByMember
    @artist = Artist.find_by member_id: params[:member_id]
    @profile = @artist.profile.where(is_billing_profile: true).first
    show_profile
  end

  def show_profile
    #artist type
    artist_type = @profile
      .profile_artist_type
      .joins(:artist_type)
      .where(is_primary: true)
      .select('artist_types.name')
      .first
    #package limit
    artist_package_items = ArtistPackageItem
      .joins(:artist_package => [{ :artist => :profile}])
      .where('artist_packages.is_current = ? and profiles.id = ?', true, @profile.id)
      .select('artist_package_items.package_item_type_code, artist_package_items.count')
    #convert to hash
    items = Hash.new
    artist_package_items.each do |item|
      items[item.package_item_type_code] = item.count
    end
    #primary photo
    photos = @profile.profile_photo
      .joins(artist_medium: [{medium: :medium_detail}])
      .order(:sequence)
    primary_photo = photos.where('profile_photos.is_primary = true').first
    primary_photo = photos.first if !primary_photo
    pp primary_photo
    json_response({
        profile: {
          id: @profile.id,
          is_billing_profile: @profile.is_billing_profile,
          is_active: @profile.is_active,
          agency_name: (@profile.agency ? @profile.agency.name : 'Freelance'),
          priarmy_artist_type_name: (artist_type ? artist_type.name : ''),
          photo_limit: (items['PHOT'].nil?? 0 : items['PHOT']),
          audio_limit: (items['AUD'].nil?? 0 : items['AUD']),
          video_limit: (items['VID'].nil?? 0 : items['VID']),
          primary_photo: primary_photo
        }
    })
  end

  def set_profile
    @profile = Profile.find(params[:id]) if params[:id].present?
  end
end
