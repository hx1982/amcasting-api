class ProfileCompCardsController < ApplicationController
  before_action :set_profile, only: [:index]

  def index
    json_response({
        :profile_comp_card => {
          id: @profile_comp_card.id,
          comp_card_type:  @profile_comp_card.comp_card_type,
          profile_comp_card_photos: @profile_comp_card.profile_comp_card_photo.map { |p| ({
            id: p.profile_photo_id,
            sequence: p.sequence,
          })},
          profile_comp_card_items: @profile_comp_card.profile_comp_card_item.map { |p| ({
            id: p.profile_item_type_id,
            sequence: p.sequence,
          })},
        }
    })
  end

  def saveCompCard
    if params[:profile_id].present? and params[:comp_card_type].present?
      @profile_comp_card = ProfileCompCard.find_by(:profile_id => params[:profile_id])
      @profile_comp_card.update(:comp_card_type => params[:comp_card_type])
      if params[:comp_card_photos].present?
        @profile_comp_card.profile_comp_card_photo.clear()
        params[:comp_card_photos].each do |index2, photo|
          @profile_comp_card.profile_comp_card_photo.create(profile_photo_id: photo[:id], sequence: photo[:sequence])
        end
      end

      if params[:comp_card_items].present?
        @profile_comp_card.profile_comp_card_item.clear()
        params[:comp_card_items].each do |index2, item|
          @profile_comp_card.profile_comp_card_item.create(profile_item_type_id: item[:id], sequence: item[:sequence])
        end
      end
    end
  end

  private
  def set_profile
    @profile = Profile.find(params[:profile_id])
    @profile_comp_card = ProfileCompCard.includes([:profile_comp_card_item, :profile_comp_card_photo]).find_by(:profile_id => @profile.id) if @profile
    if @profile_comp_card.nil?
      @profile_comp_card = @profile.create_profile_comp_card!(:comp_card_type => 1)
    end
  end
end
