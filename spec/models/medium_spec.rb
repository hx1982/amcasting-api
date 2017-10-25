require 'rails_helper'

RSpec.describe Medium, type: :model do
  it { should belong_to(:medium_type)}
  it { should have_one(:medium_detail)}
  it { should validate_presence_of(:file_path)}
  it { should validate_presence_of(:file_name)}
  it { should validate_presence_of(:file_type)}
  it { should validate_presence_of(:medium_type)}
end
