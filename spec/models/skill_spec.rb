require 'rails_helper'

RSpec.describe Skill, type: :model do
  it {should belong_to(:skill_group)}
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:sequence)}
end
