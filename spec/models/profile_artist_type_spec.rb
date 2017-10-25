require 'rails_helper'

RSpec.describe ProfileArtistType, type: :model do
  it { should belong_to(:profile)}
  it { should belong_to(:artist_type)}
  it { should validate_presence_of(:is_primary)}
  it { should validate_presence_of(:sequence)}
  it { should validate_presence_of(:profile)}
  it { should validate_presence_of(:artist_type)}
end
