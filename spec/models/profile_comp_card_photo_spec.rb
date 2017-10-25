require 'rails_helper'

RSpec.describe ProfileCompCardPhoto, type: :model do
  it { should belong_to(:profile_comp_card)}
  it { should belong_to(:profile_photo)}
  it { should validate_presence_of(:profile_photo)}
  it { should validate_presence_of(:profile_comp_card)}
  it { should validate_presence_of(:sequence)}
end
