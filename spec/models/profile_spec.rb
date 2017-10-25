require 'rails_helper'

RSpec.describe Profile, type: :model do
  it {should belong_to(:artist)}
  it {should have_many(:profile_audio)}
  it {should have_many(:profile_video)}
  it {should have_many(:profile_photo)}
  it {should have_many(:profile_artist_type)}
  it {should have_many(:profile_skill)}
  it {should have_many(:profile_item)}
  it {should have_many(:profile_social)}
  it {should have_one(:profile_comp_card)}
  it {should have_one(:profile_resume)}
  it {should validate_presence_of(:artist)}
  it {should validate_presence_of(:is_billing_profile)}
  it {should validate_presence_of(:is_active)}

end
