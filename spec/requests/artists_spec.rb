require 'rails_helper'

RSpec.describe "Artists API" do
  let!(:user) { create(:user) }
  let!(:member_source_type) { create(:member_source_type)}
  let!(:member_type) { create(:member_type) }
  let!(:account_status_type) { create(:account_status_type)}
  let!(:member) { create(:member, member_source_type_id:member_source_type.id,
      member_type_id: member_type.id, account_status_type_id: account_status_type.id,
      user_id: user.id)
  }
  let!(:country) { create(:country) }
  let!(:state) { create(:state, country_id: country.id) }
  let!(:city) { create(:city, state_id: state.id)}
  let!(:bank_account) { create(:bank_account)}
  let!(:company) { create(:company)}
  let!(:superannuation) { create(:superannuation)}
  let!(:tax_type) { create(:tax_type) }
  let!(:tax) { create(:tax, tax_type_id: tax_type.id)}
  let!(:artist) { create(:artist, member_id: member.id,
      bank_account_id: bank_account.id,
      company_id: company.id,
      passport_country_id: country.id,
      superannuation_id: superannuation.id,
      tax_id: tax.id
    )}
  let!(:artist_city) { create(:artist_city, artist_id: artist.id, city_id: city.id)}
  let(:member_id) { member.id }
  let(:artist_id) { artist.id }

  describe 'GET /artists/:id' do
    before { get "/artists/#{artist_id}" }

    context 'when artist exists' do
      it "return status code 200" do
        expect(response).to have_http_status(200)
      end

      it 'return artist' do
        expect(json).not_to be_empty
        expect(json['member']['first_name']).to eq(member.first_name)
        expect(json['bank_account']['bank_name']).to eq(bank_account.bank_name)
        expect(json['artist_city'][0]['city_full_name']).not_to be_empty
      end
    end

    context 'when artist not exists' do
      let(:artist_id) { 0 }

      it 'return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find")
      end
    end
  end

  describe 'PUT /artists/:id' do
    let(:valid_attributes) {{
        dob: '1982-04-01',
        is_dob_visible: true,
        primary_occupation: 'programer',
        passport_country_id: country.id,
        passport_number: '1234',
        age_to: 30,
        age_from: 12,
        member_id: member_id,
        bank_account: {
          bank_name: 'AZD',
          bank_swift_code: '123',
          bank_location: 'vic',
          account_name: 'leon',
          account_number: '456',
        },
        tax: {
          juristiction: 'test',
          number: '123',
          tax_type_id: tax_type.id,
        },
        company: {
          name: 'test',
          number: '123',
          company_type: 'test'
        },
        superannuation: {
          company: 'test2',
          number: '123',
          social_security_number: '456'
        },
        cities:[
          city.id
        ]
    }}

    context 'The request is valid' do
      before { put "/artists/#{artist_id}", params: valid_attributes}

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns artist data' do
        expect(json['bank_account']['bank_name']).to eq('AZD')
        expect(json['superannuation']['number']).to eq('123')
        expect(json['tax']['juristiction']).to eq('test')
        expect(json['company']['name']).to eq('test')
        expect(json['artist_city'].size).to eq(1)
      end
    end

  end
end
