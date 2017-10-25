require 'rails_helper'
require 'pp'

RSpec.describe 'Members API' do
  let!(:user) { create(:user) }
  let!(:member_source_type) { create(:member_source_type)}
  let!(:member_type) { create(:member_type) }
  let!(:account_status_type) { create(:account_status_type)}
  let!(:member) { create(:member, member_source_type_id:member_source_type.id,
      member_type_id: member_type.id, account_status_type_id: account_status_type.id,
      user_id: user.id)
  }
  let!(:address_location_type) { create(:address_location_type) }
  let!(:address_type) { create(:address_type)}
  let!(:country) { create(:country)}
  let!(:state) { create(:state, country_id: country.id)}
  let!(:city) { create(:city, state_id: state.id)}
  let!(:address) { create(:address, country_id: country.id, state_id: state.id, city_id: city.id,
    address_type_id: address_type.id, address_location_type_id: address_location_type.id)}
  let!(:member_address) { create(:member_address, member_id: member.id, address_id: address.id)}
  let!(:contact_type) { create(:contact_type)}
  let!(:contact) { create(:contact, contact_type_id:contact_type.id)}
  let!(:member_contact) { create(:member_contact, member_id:member.id, contact_id:contact.id)}
  let(:member_address_id) { member_address.id}
  let(:member_id) { member.id}
  let(:address_id) { address.id}
  let(:member_contact_id) { member_contact.id }
  let(:contact_id) { contact.id}

  describe 'GET /members/:member_id' do
    before { get "/members/#{member_id}"}

    context 'when member exists' do
      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'return member' do
        expect(json).not_to be_empty
        expect(json['id']).to equal(member_id)
      end
    end
  end

  describe 'GET /members/:member_id/addresses' do
    before { get "/members/#{member_id}/addresses"}
    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'return addresses' do
      expect(json).not_to be_empty
      expect(json.size).to equal(1)
      expect(json[0]['id']).to equal(member_address_id)
      expect(json[0]['address']).not_to be_empty
      expect(json[0]['address']['street']).to eq(address.street)
    end
  end

  describe 'DELETE /members/:member_id/addresses/:id' do
     before { delete "/members/#{member_id}/addresses/#{member_address_id}"}
     it 'returns status code 204' do
       expect(response).to have_http_status(204)
     end
  end

  describe 'POST /members/:member_id/addresses/' do
     let(:valid_attributes) { {
          address_location_type_id: address_location_type.id,
          address_type_id: address_type.id,
          street: 'tianfu',
          street2: 'xingu',
          post_code: '100001',
          country_id: country.id,
          state_id: state.id,
          city_id: city.id,
          is_primary: false,
          is_visible: true
        } }

     before { post "/members/#{member_id}/addresses", params: valid_attributes}
     it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end

     it 'returns address' do
       expect(json['is_visible']).to equal(true)
       expect(json['sequence']).to be >= 1
     end
  end

  describe 'PUT /members/:member_id/addresses/:id' do
    let(:valid_attributes) { {
         street: 'test street2',
         is_visible: false
       } }
    before { put "/members/#{member_id}/addresses/#{member_address_id}", params: valid_attributes}

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'update and return the address' do
      expect(json['is_visible']).to equal(false)
      expect(json['address']['street']).to eq('test street2')
    end

  end

  describe 'GET /members/:member_id/contacts' do
    before { get "/members/#{member_id}/contacts"}
    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'return contacts' do
      expect(json).not_to be_empty
      expect(json.size).to equal(1)
      expect(json[0]['id']).to equal(member_contact_id)
    end
  end

  describe 'DELETE /members/:member_id/contacts/:id' do
    before { delete "/members/#{member_id}/contacts/#{member_contact_id}"}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'should throw error' do
      get "/members/#{member_id}/contacts/#{member_contact_id}"
      expect(response).to have_http_status(404)
    end
  end

  describe 'POST /members/:member_id/contacts/' do
     let(:valid_attributes) { {
          contact_type_id: contact_type.id,
          phone: '40010001',
          email: 'test@at2.com.au',
          is_primary: true,
          is_visible: true
        } }

     before { post "/members/#{member_id}/contacts", params: valid_attributes}
     it 'returns status code 201' do
       expect(response).to have_http_status(201)
     end

     it 'returns address' do
       expect(json['is_visible']).to eq(true)
       expect(json['contact']['phone']).to eq('40010001')
     end
  end

  describe 'PUT /members/:member_id/contacts/:id' do
    let(:valid_attributes) { {
         phone: '40010002',
         is_visible: false
       } }
    before { put "/members/#{member_id}/contacts/#{member_contact_id}", params: valid_attributes}

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'update and return the address' do
      expect(json['is_visible']).to eq(false)
      expect(json['contact']['phone']).to eq('40010002')
    end

  end
end
