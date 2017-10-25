require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should belong_to(:address_location_type) }
  it { should belong_to(:address_type)}
  it { should belong_to(:country)}
  it { should belong_to(:state)}
  it { should belong_to(:city)}
  it { should validate_presence_of(:address_location_type) }
  it { should validate_presence_of(:address_type)}
  it { should validate_presence_of(:country)}
  it { should validate_presence_of(:state)}
end
