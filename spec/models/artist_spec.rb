require 'rails_helper'

RSpec.describe Artist, type: :model do
  it { should validate_presence_of(:dob)}
  it { should validate_presence_of(:member)}
  it { should belong_to(:member)}
  it { should belong_to(:tax)}
  it { should belong_to(:company)}
  it { should belong_to(:bank_account)}
  it { should belong_to(:superannuation)}
  it { should have_many(:artist_city)}
  it { should have_many(:city).through(:artist_city)}
  it { should have_many(:profile)}
  it { should have_many(:artist_medium)}
  it { should have_many(:medium).through(:artist_medium)}
end
