require 'rails_helper'

RSpec.describe ProfileSkill, type: :model do
  it {should belong_to(:profile)}
  it {should belong_to(:skill)}
  it {should validate_presence_of(:profile)}
  it {should validate_presence_of(:skill)}
  it {should validate_presence_of(:level)}
end
