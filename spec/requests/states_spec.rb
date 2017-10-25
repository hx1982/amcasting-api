require 'rails_helper'

RSpec.describe 'States API' do
  let!(:country) { create(:country)}
  let!(:states) { create_list(:state, 10, country_id: country.id)}
  let(:country_id) {country.id}
  let(:id) { states.first.id}

  describe 'GET /countries/:country_id/states' do
    before { get "/countries/#{country_id}/states"}

    context 'when country exists' do
      it 'returns status code 200 ' do
        expect(response).to have_http_status(200)
      end

      it 'returns all country states' do
        expect(json.size).to eq(10)
      end
    end

    context 'when country does not exist' do
      let (:country_id) {0}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find")
      end
    end

  end
end
