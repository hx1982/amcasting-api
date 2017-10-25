require 'rails_helper'

RSpec.describe 'Profile Item Types API' do
  let!(:profile_item_type1) { create(:profile_item_type, code: 'ENTH', type_code: 'VALU' )}
  let!(:profile_item_type2) { create(:profile_item_type, code: 'HGHT', type_code: 'MIMA' )}
  let!(:profile_item_type3) { create(:profile_item_type, code: 'BRAS', type_code: 'CONV' )}
  let!(:profile_value_item_type_value) {
    create(:profile_value_item_type_value, profile_item_type_code: 'ENTH', profile_item_type_id: profile_item_type1.id,
      name: 'Chinese'
    )
  }
  let!(:profile_range_item_type_value) {
    create(:profile_range_item_type_value, profile_item_type_code: 'HGHT', profile_item_type_id: profile_item_type2.id,
      min: 150, max:250, step: 1
    )
  }
  let!(:conversion) {
    create(:conversion, profile_item_type_code: 'BRAS', profile_item_type_id: profile_item_type3.id,
      sequence: 1, uk_value: '11', eu_value: '11', au_value: '11', fr_value: '11'
    )
  }
  describe 'GET /profile_value_item_type_values' do
    before { get '/profile_item_types'}

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'return profile item types' do
      pp json
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

  end

  describe 'GET /profile_item_types/ethnicities' do
    before { get '/profile_item_types/ethnicities'}

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'return profile item types' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

  end
end
