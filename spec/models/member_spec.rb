require 'rails_helper'

RSpec.describe Member, type: :model do
it {should validate_presence_of(:first_name)}
 it {should validate_presence_of(:last_name)}
 it {should validate_presence_of(:gender_code)}
 it {should validate_presence_of(:member_type)}
 it {should validate_presence_of(:member_source_type)}
 it {should validate_presence_of(:account_status_type)}
 it {should validate_presence_of(:user)}
 it {should belong_to(:user)}
 it {should belong_to(:member_type)}
 it {should belong_to(:member_source_type)}
 it {should belong_to(:account_status_type)}
 it {should have_many(:member_contact)}
 it {should have_many(:member_address)}
end
