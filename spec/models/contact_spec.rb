require 'rails_helper'

RSpec.describe Contact, type: :model do
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:phone)}
  it {should validate_presence_of(:contact_type)}
  it {should belong_to(:contact_type)}
end
