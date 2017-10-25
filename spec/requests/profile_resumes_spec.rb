require 'rails_helper'

RSpec.describe 'Profile Resume API' do
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
  let!(:medium_type_photo) { create(:medium_type, code: 'PHOT')}
  let!(:medium_type_audio) { create(:medium_type, code: 'AUD')}
  let!(:medium_type_video) { create(:medium_type, code: 'VID')}
  let!(:medium_photo) { create(:medium, medium_type_id: medium_type_photo.id)}
  let!(:medium_audio) { create(:medium, medium_type_id: medium_type_audio.id)}
  let!(:medium_video) { create(:medium, medium_type_id: medium_type_video.id)}
  let!(:artist_medium1) { create(:artist_medium, artist_id: artist.id, medium_id: medium_photo.id, sequence: 1)}
  let!(:artist_medium2) { create(:artist_medium, artist_id: artist.id, medium_id: medium_audio.id, sequence: 2)}
  let!(:artist_medium3) { create(:artist_medium, artist_id: artist.id, medium_id: medium_video.id, sequence: 3)}
  let!(:medium_detail1) { create(:medium_detail, medium_id:medium_photo.id, title: 'test photo')}
  let!(:medium_detail2) { create(:medium_detail, medium_id:medium_audio.id, title: 'test audio')}
  let!(:medium_detail3) { create(:medium_detail, medium_id:medium_video.id, title: 'test video')}
  let!(:profile_photo) { create(:profile_photo, profile_id: profile.id,
    artist_medium_id: artist_medium1.id, sequence: 1, is_primary: true)}
  let!(:profile_audio) { create(:profile_audio, profile_id: profile.id,
    artist_medium_id: artist_medium2.id, sequence: 1, is_primary: true)}
  let!(:profile_video) { create(:profile_video, profile_id: profile.id,
    artist_medium_id: artist_medium3.id, sequence: 1, is_primary: true)}
  let!(:profile_resume) { create(:profile_resume, profile_id: profile.id)}
  let!(:resume_table){ create(:resume_table, profile_resume_id: profile_resume.id, row: 2, column: 4, sequence: 0)}
  let!(:resume_table_cell1) { create(:resume_table_cell, resume_table_id: resume_table.id, row:0, column:0, text: '2000 - 2001')}
  let!(:resume_table_cell2) { create(:resume_table_cell, resume_table_id: resume_table.id, row:1, column:0, text: '2001 - 2002')}
  let!(:resume_table_medium1) { create(:resume_table_medium, resume_table_id: resume_table.id, row:0, sequence:0, artist_medium_id: artist_medium1.id)}
  let!(:resume_table_medium2) { create(:resume_table_medium, resume_table_id: resume_table.id, row:1, sequence:0, artist_medium_id: artist_medium2.id)}
  let!(:resume_paragraphy) { create(:resume_paragraphy, profile_resume_id: profile_resume.id, sequence: 1)}
  let(:profile_id) { profile.id }
  let(:profile_resume_id) { profile_resume.id}
  describe 'GET /profiles/:profile_id/resumes' do
    before { get "/profiles/#{profile_id}/resumes"}

    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'return resume' do
      expect(json).not_to be_empty
    end

  end

  describe 'PUT /profiles/:profile_id/resumes/:id' do
    let(:valid_attributes) {{
      paragraphies: [
        {
          text: 'paragraphy',
          sequence: 0
        },
        {
          text: 'paragraphy',
          sequence: 2
        }
      ],
      tables: [
        {
          sequence: 1,
          row: 2,
          column: 4,
          title: 'table',
          cells: [
            {
              row: 0,
              column: 0,
              text: 'cell1'
            },
            {
              row: 1,
              column: 0,
              text: 'cell2'
            }
          ],
          media: [
            {
              row: 0,
              sequence: 0,
              artist_medium_id: profile_photo.id
            },
            {
              row: 1,
              sequence: 0,
              artist_medium_id: profile_audio.id
            }
          ]
        }
      ]
      }}

    before { put "/profiles/#{profile_id}/resumes/#{profile_resume_id}", params: valid_attributes}
    it 'return status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'update resume correctly' do
      expect(json['resume_paragraphy'].size).to eq(2)
    end


  end


end
