require 'rails_helper'

RSpec.describe ResumeParagraph, type: :model do
  it {should belong_to(:profile_resume)}
  it {should validate_presence_of(:sequence)}
  it {should validate_presence_of(:profile_resume)}
end
