require 'rails_helper'

RSpec.describe 'Profile SKills API' do
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
  let!(:skill_group_language) { create(:skill_group, name: 'Language', sequence: 1)}
  let!(:skill_group_accent) { create(:skill_group, name: 'Accent', sequence: 2)}
  let!(:language_skills) { create_list(:skill, 10, skill_group_id: skill_group_language.id)}
  let!(:accent_skills) { create_list(:skill, 10, skill_group_id: skill_group_accent.id)}
  let!(:profile_skill1) { create(:profile_skill,
    profile_id: profile.id,
    skill_id: language_skills.first.id,
    level: 2)}
  let!(:profile_skill2) { create(:profile_skill,
    profile_id: profile.id,
    skill_id: language_skills[1].id,
    level: 2)}
  let!(:profile_skill3) { create(:profile_skill,
    profile_id: profile.id,
    skill_id: accent_skills.first.id,
    level: 3)}
  let(:profile_id) { profile.id}

  describe 'GET /profiles/:profile_id/skills' do
    before { get "/profiles/#{profile_id}/skills"}

    it 'should return status 200' do
      expect(response).to have_http_status(200)
    end

    it 'should return profile skills' do
      expect(json.size).to eq(3)
      expect(json[0]['id']).to eq(profile_skill1.id)
    end
  end

  describe 'PUT /profiles/:profile_id/skills' do

  end
end
