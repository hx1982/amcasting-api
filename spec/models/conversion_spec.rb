require 'rails_helper'

RSpec.describe Conversion, type: :model do
  it { should belong_to(:profile_item_type)}
  it { should validate_presence_of(:profile_item_type)}
  it { should validate_presence_of(:profile_item_type_code)}
  it { should validate_presence_of(:sequence)}
end
