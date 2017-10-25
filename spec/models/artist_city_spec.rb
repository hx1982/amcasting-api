require 'rails_helper'

RSpec.describe ArtistCity, type: :model do
  it { should belong_to(:artist)}
  it { should belong_to(:city)}
  it { should validate_presence_of(:artist)}
  it { should validate_presence_of(:city)}
end
