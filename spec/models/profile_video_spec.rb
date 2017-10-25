require 'rails_helper'

RSpec.describe ProfileVideo, type: :model do
  it { should belong_to(:profile)}
  it { should belong_to(:artist_medium)}
  it { should validate_presence_of(:artist_medium)}
  it { should validate_presence_of(:profile)}
end
