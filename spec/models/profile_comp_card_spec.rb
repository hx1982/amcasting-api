require 'rails_helper'

RSpec.describe ProfileCompCard, type: :model do
  it { should belong_to(:profile)}
  it { should belong_to(:comp_card_type)}
  it { should validate_presence_of(:profile)}
  it { should validate_presence_of(:comp_card_type)}
  it { should have_many(:profile_comp_card_item)}
  it { should have_many(:profile_comp_card_photo)}
end
