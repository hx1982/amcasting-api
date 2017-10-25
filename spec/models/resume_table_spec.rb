require 'rails_helper'

RSpec.describe ResumeTable, type: :model do
  it {should belong_to(:profile_resume)}
  it {should have_many(:resume_table_cell)}
  it {should have_many(:resume_table_medium)}
  it {should validate_presence_of(:row)}
  it {should validate_presence_of(:column)}
  it {should validate_presence_of(:profile_resume)}
end
