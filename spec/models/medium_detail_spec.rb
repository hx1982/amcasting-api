require 'rails_helper'

RSpec.describe MediumDetail, type: :model do
  it { should belong_to(:medium)}
  it { should have_one(:audio_detail)}
end
