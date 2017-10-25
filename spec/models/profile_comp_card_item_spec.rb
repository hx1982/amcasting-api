require 'rails_helper'

RSpec.describe ProfileCompCardItem, type: :model do
  it { should belong_to(:profile_comp_card)}
  it { should belong_to(:profile_item_type)}
  it { should validate_presence_of(:sequence)}
  it { should validate_presence_of(:profile_comp_card)}
  it { should validate_presence_of(:profile_item_type)}
end
