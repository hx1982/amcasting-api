require 'rails_helper'

RSpec.describe 'SKills API' do
  let!(:skill_group_language) { create(:skill_group, name: 'Language', sequence: 1)}
  let!(:skill_group_accent) { create(:skill_group, name: 'Accent', sequence: 2)}
  let!(:language_skills) { create_list(:skill, 10, skill_group_id: skill_group_language.id)}
  let!(:accent_skills) { create_list(:skill, 10, skill_group_id: skill_group_accent.id)}

  describe 'GET /skills' do
    before { get '/skills'}

    it 'should return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'should return skill and skill groups' do
      expect(json.size).to eq(2)
    end

  end
end
