require 'rails_helper'

RSpec.describe ProfileItem, type: :model do
  it {should belong_to(:profile)}
  it {should belong_to(:profile_item_type)}
  it {should validate_presence_of(:profile)}
  it {should validate_presence_of(:profile_item_type)}
  it {should have_many(:profile_item_value)}
end
