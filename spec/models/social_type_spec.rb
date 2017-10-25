require 'rails_helper'

RSpec.describe SocialType, type: :model do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:code)}
  it { should validate_presence_of(:sequence)}
end
