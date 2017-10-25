require 'rails_helper'

RSpec.describe MemberContact, type: :model do
  it { should belong_to(:member)}
  it { should belong_to(:contact)}
  it { should validate_presence_of(:member)}
  it { should validate_presence_of(:contact)}
end
