require 'rails_helper'

RSpec.describe MemberAddress, type: :model do
  it { should belong_to(:member)}
  it { should belong_to(:address)}
  it { should validate_presence_of(:member)}
end
