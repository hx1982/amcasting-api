require 'rails_helper'

RSpec.describe 'Comp Card Types API' do
  let!(:comp_card_type) { create(:comp_card_type)}

  describe 'GET /comp_card_types' do

    before { get '/comp_card_types'}

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'return comp card types' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end
  end
end
