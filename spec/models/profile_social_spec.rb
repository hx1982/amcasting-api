require 'rails_helper'

RSpec.describe ProfileSocial, type: :model do
  it {should belong_to(:profile)}
  it {should belong_to(:social_type)}
  it {should validate_presence_of(:profile)}
  it {should validate_presence_of(:social_type)}
  it {should validate_presence_of(:link)}
end
