require 'rails_helper'

RSpec.describe 'Profile Comp Card API' do
  let!(:user) { create(:user) }
  let!(:member_source_type) { create(:member_source_type)}
  let!(:member_type) { create(:member_type) }
  let!(:account_status_type) { create(:account_status_type)}
  let!(:member) { create(:member, member_source_type_id:member_source_type.id,
      member_type_id: member_type.id, account_status_type_id: account_status_type.id,
      user_id: user.id)
  }
  let!(:artist) { create(:artist, member_id: member.id,
    )}
  let!(:profile) { create(:profile, artist_id: artist.id, is_billing_profile: true, is_active: true)}
  let!(:medium_type) { create(:medium_type, code: 'PHOT')}
  let!(:medium) { create_list(:medium, 5, medium_type_id: medium_type.id)}
  let!(:artist_medium1) { create(:artist_medium, artist_id: artist.id, medium_id: medium[0].id, sequence: 1)}
  let!(:artist_medium2) { create(:artist_medium, artist_id: artist.id, medium_id: medium[1].id, sequence: 2)}
  let!(:artist_medium3) { create(:artist_medium, artist_id: artist.id, medium_id: medium[2].id, sequence: 3)}
  let!(:artist_medium4) { create(:artist_medium, artist_id: artist.id, medium_id: medium[3].id, sequence: 4)}
  let!(:artist_medium5) { create(:artist_medium, artist_id: artist.id, medium_id: medium[4].id, sequence: 5)}
  let!(:medium_detail1) { create(:medium_detail, medium_id:medium[0].id, title: 'test1')}
  let!(:medium_detail2) { create(:medium_detail, medium_id:medium[1].id, title: 'test2')}
  let!(:medium_detail3) { create(:medium_detail, medium_id:medium[2].id, title: 'test3')}
  let!(:medium_detail4) { create(:medium_detail, medium_id:medium[3].id, title: 'test4')}
  let!(:medium_detail5) { create(:medium_detail, medium_id:medium[4].id, title: 'test5')}
  let!(:profile_photo1) { create(:profile_photo, profile_id: profile.id,
    artist_medium_id: artist_medium1.id, sequence: 1, is_primary: true)}
  let!(:profile_photo2) { create(:profile_photo, profile_id: profile.id,
    artist_medium_id: artist_medium2.id, sequence: 3, is_primary: false)}
  let!(:profile_photo3) { create(:profile_photo, profile_id: profile.id,
    artist_medium_id: artist_medium3.id, sequence: 2, is_primary: false)}
  let!(:comp_card_type) { create(:comp_card_type)}
  let!(:comp_card_type2) { create(:comp_card_type)}
  let!(:profile_comp_card) { create(:profile_comp_card, profile_id: profile.id, comp_card_type_id:comp_card_type.id)}
  let!(:profile_comp_card_photo) { create(:profile_comp_card_photo,
      profile_photo_id: profile_photo1.id, profile_comp_card_id: profile_comp_card.id, sequence: 1) }
  let!(:profile_item_types){ create_list(:profile_item_type, 5)}
  let(:profile_id) { profile.id }
  let(:profile_comp_card_id) { profile_comp_card.id }

  describe 'GET /profiels/:profile_id/comp_cards' do
    before { get "/profiles/#{profile_id}/comp_cards"}

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'return comp card' do
      expect(json).not_to be_empty
    end
  end

  describe 'PUT /profiles/:profile_id/comp_cards/:id' do
    let(:valid_attributes){{
      comp_card_type_id: comp_card_type2.id,
      photos: [profile_photo1.id, profile_photo2.id, profile_photo3.id],
      items: [profile_item_types[0].id, profile_item_types[1].id, profile_item_types[2].id]
    }}
    before { put "/profiles/#{profile_id}/comp_cards/#{profile_comp_card_id}", params: valid_attributes}

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'save the profile comp card successful' do
      expect(json).not_to be_empty
      expect(json['comp_card_type_id']).to eq(comp_card_type2.id)
    end
  end


end
