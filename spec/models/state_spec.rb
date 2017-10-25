require 'rails_helper'

RSpec.describe State, type: :model do
  it { should belong_to(:country)}
  it { should have_many(:cities).dependent(:destroy) }
  it { should validate_presence_of(:name)}
end
