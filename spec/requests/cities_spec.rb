require 'rails_helper'

RSpec.describe 'Cities API' do
  let!(:country) { create(:country) }
  let!(:state) { create(:state, country_id:country.id) }
  let!(:cities) { create_list(:city, 10, state_id:state_id)}
  let(:country_id) { country.id }
  let(:state_id) { state.id }
  let(:id) { cities.first.id }

  describe 'GET /countries/:country_id/states/:state_id/cities' do
    before { get "/countries/#{country_id}/states/#{state_id}/cities"}

    context 'when state exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all cities' do
        expect(json.size).to eq(10)
      end
    end
  end

end
