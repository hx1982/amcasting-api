require 'rails_helper'

RSpec.describe ProfileValueItemTypeValue, type: :model do
  it {should belong_to(:profile_item_type)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:sequence)}
  it {should validate_presence_of(:profile_item_type)}
  it {should validate_presence_of(:profile_item_type_code)}
end
