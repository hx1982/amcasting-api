require 'rails_helper'

RSpec.describe 'Artist Medias API' do
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
  let!(:medium_type) { create(:medium_type, code: 'AUD')}
  let!(:medium_type2) { create(:medium_type, code: 'VID')}
  let!(:medium_type3) { create(:medium_type, code: 'PHOT')}
  let!(:medium) { create_list(:medium, 10, medium_type_id: medium_type.id)}
  let!(:medium2) { create_list(:medium, 10, medium_type_id: medium_type2.id)}
  let!(:medium3) { create_list(:medium, 10, medium_type_id: medium_type3.id)}
  let!(:medium_detail) { create(:medium_detail, medium_id:medium.first.id, title: 'show')}
  let!(:medium_detail2) { create(:medium_detail, medium_id:medium2.first.id, title: 'music')}
  let!(:medium_detail3) { create(:medium_detail, medium_id:medium3.first.id, title: 'action')}
  let!(:medium_detail4) { create(:medium_detail, medium_id:medium3[1].id, title: 'show')}
  let!(:artist_medium) { create(:artist_medium, artist_id: artist.id, medium_id: medium.first.id)}
  let!(:artist_medium2) { create(:artist_medium, artist_id: artist.id, medium_id: medium2[0].id)}
  let!(:artist_medium3) { create(:artist_medium, artist_id: artist.id, medium_id: medium3[0].id)}
  let!(:artist_medium4) { create(:artist_medium, artist_id: artist.id, medium_id: medium3[1].id)}
  let(:member_id) { member.id }
  let(:artist_id) { artist.id }
  let(:artist_medium_id) { artist_medium.id}
  let(:medium_id) { medium.first.id}

  describe 'GET /artists/:artist_id/media' do
    before { get "/artists/#{artist_id}/media"}

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'return media' do
      expect(json).not_to be_empty
      expect(json.size).to eq(4)
    end
  end

  describe 'GET /artists/:artist_id/media?type=medium_type' do
    it 'return  audios' do
      get "/artists/#{artist_id}/media?medium_type_code=AUD"
      expect(json.size).to eq(1)
    end

    it 'return  audios' do
      get "/artists/#{artist_id}/media?medium_type_code=AUD,VID"
      expect(json.size).to eq(2)
    end
  end

  describe 'GET /artists/:artist_id/media?key_word' do
    it 'return music keyword' do
      get "/artists/#{artist_id}/media?key_word=music"
      expect(json.size).to eq(1)
    end

    it 'return reading keyword' do
      get "/artists/#{artist_id}/media?key_word=reading"
      expect(json.size).to eq(0)
    end
  end

  describe 'GET /artists/:artist_id/media?key_word&type' do
    it 'return photo by type and keyword' do
      get "/artists/#{artist_id}/media?medium_type_code=PHOT"
      expect(json.size).to eq(2)
    end

    it 'return photo by type and keyword' do
      get "/artists/#{artist_id}/media?key_word=show&medium_type_code=PHOT"
      expect(json.size).to eq(1)
    end
  end

  describe 'GET /artists/:artist_id/media?order' do
    it 'return photo by type and keyword' do
      get "/artists/#{artist_id}/media?order_by=a-z"
      expect(json).not_to be_empty
      expect(json[0]['id']).to eq(artist_medium3.id)
    end
  end

  describe 'GET /artists/:artist_id/media/:id' do
    before { get "/artists/#{artist_id}/media/#{artist_medium_id}"}

    it 'retrun status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /artists/:artist_id/media/:id' do
    before { delete "/artists/#{artist_id}/media/#{artist_medium_id}"}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'returns status code 404 after delete' do
      get "/media/#{medium_id}"
      expect(response).to have_http_status(404)
    end
  end

  describe 'Update /artists/:artist_id/media/:id' do
    let(:valid_attributes) {{
        title: 'leon',
        description: 'Leon''s media',
        gender_code: 'MALE',
        age_from: '10',
        age_to: '20',
        styles: '30'
    }}
    before { put "/artists/#{artist_id}/media/#{artist_medium_id}", params:valid_attributes }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'update and return the medium' do
      expect(json['medium_detail']['title']).to eq('leon')
    end

    it 'update audio detail and return the medium' do
      expect(json['medium_detail']['audio_detail']['styles']).to eq('30')
    end
  end

end
