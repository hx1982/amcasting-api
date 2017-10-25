require 'rails_helper'

RSpec.describe ProfileRangeItemTypeValue, type: :model do
  it {should belong_to(:profile_item_type)}
  it {should validate_presence_of(:min)}
  it {should validate_presence_of(:max)}
  it {should validate_presence_of(:step)}
  it {should validate_presence_of(:profile_item_type)}
  it {should validate_presence_of(:profile_item_type_code)}
end
