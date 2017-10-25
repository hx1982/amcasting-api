require 'rails_helper'

RSpec.describe ArtistMedium, type: :model do
  it { should belong_to(:artist)}
  it { should belong_to(:medium)}
  it { should validate_presence_of(:artist)}
  it { should validate_presence_of(:medium)}
end
