require 'rails_helper'

RSpec.describe ProfileItemType, type: :model do
  it {should validate_presence_of(:code)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:type_code)}
  it {should validate_presence_of(:sequence)}
  it {should have_one(:profile_range_item_type_value)}
  it {should have_many(:profile_value_item_type_value)}
  it {should have_many(:conversion)}
end
