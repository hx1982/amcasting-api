require 'rails_helper'

RSpec.describe ProfileResume, type: :model do
  it {should belong_to(:profile)}
  it {should have_many(:resume_table)}
  it {should have_many(:resume_paragraphy)}
  it {should validate_presence_of(:profile)}
end
