require 'rails_helper'

RSpec.describe SkillGroup, type: :model do
  it { should have_many(:skill)}
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:sequence)}
end
