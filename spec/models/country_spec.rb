require 'rails_helper'

RSpec.describe Country, type: :model do
  it { should have_many(:states).dependent(:destroy) }
  it { should validate_presence_of(:country_code) }
  it { should validate_presence_of(:name) }
end
