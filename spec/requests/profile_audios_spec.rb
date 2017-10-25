require 'rails_helper'

RSpec.describe 'Profile audios API' do
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
  let!(:medium_type) { create(:medium_type, code: 'AUD')}
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
  let!(:profile_audio1) { create(:profile_audio, profile_id: profile.id,
    artist_medium_id: artist_medium1.id, sequence: 1, is_primary: true)}
  let!(:profile_audio2) { create(:profile_audio, profile_id: profile.id,
    artist_medium_id: artist_medium2.id, sequence: 3, is_primary: false)}
  let!(:profile_audio3) { create(:profile_audio, profile_id: profile.id,
    artist_medium_id: artist_medium3.id, sequence: 2, is_primary: false)}
  let(:profile_id) { profile.id }
  let(:profile_audio_id) { profile_audio2.id}
  let(:primary_profile_audio_id) { profile_audio1.id}

  describe 'GET /profiles/:profile_id/audios' do
    before { get "/profiles/#{profile_id}/audios"}

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'return audios' do
      expect(json.size).to eq(3)
      expect(json[0]['id']).to eq(profile_audio1.id)
      expect(json[1]['id']).to eq(profile_audio3.id)
      expect(json[2]['id']).to eq(profile_audio2.id)
    end
  end

  describe 'GET /profiles/:profile_id/audios/preview' do
    before { get "/profiles/#{profile_id}/audios/preview"}

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'return audios' do
      expect(json.size).to eq(2)
      expect(json[0]['id']).to eq(artist_medium4.id)
    end
  end

  describe 'PUT /profiles/:profile_id/audios/:id/primary' do
    before { put "/profiles/#{profile_id}/audios/#{profile_audio_id}/primary"}

    it 'return status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'change primary correct' do
       get "/profiles/#{profile_id}/audios"
       expect(json[0]['is_primary']).to eq(false)
       expect(json[2]['is_primary']).to eq(true)
    end
  end

  describe 'DELETE /profiles/:profile_id/audios/:id' do
    before { delete "/profiles/#{profile_id}/audios/#{primary_profile_audio_id}"}

    it 'return status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'delete profile audio correctly' do
       get "/profiles/#{profile_id}/audios/preview"
       expect(json.size).to eq(3)
    end

    it 'change primary correctly when delete primary audio' do
       get "/profiles/#{profile_id}/audios"
       expect(json.size).to eq(2)
    end
  end

  describe 'PUT /profiles/:profile_id/audios/apply' do
    let(:valid_params) {{
        artist_medium_id: artist_medium4.id
    }}
    before { put "/profiles/#{profile_id}/audios/apply", params: valid_params}

    it 'return status code 201' do
      expect(response).to have_http_status(201)
    end

    it 'return profile audio' do
      expect(json['sequence']).to eq(4)
      expect(json['artist_medium_id']).to eq(artist_medium4.id)
      expect(json['is_primary']).to eq(false)
    end
  end

  describe 'PUT /profiles/:profile_id/audios/resort' do
    let(:valid_params) {{
        from_profile_audio_id: profile_audio1.id,
        to_profile_audio_id: profile_audio3.id
    }}

    before { put "/profiles/#{profile_id}/audios/resort", params: valid_params}

    it 'return status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'resort audio sequence' do
      get "/profiles/#{profile_id}/audios"
      expect(json[0]['id']).to eq(profile_audio3.id)
    end
  end
end
