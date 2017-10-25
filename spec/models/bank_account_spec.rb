require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  it { should validate_presence_of(:bank_name)}
  it { should validate_presence_of(:bank_location)}
  it { should validate_presence_of(:account_name)}
  it { should validate_presence_of(:account_number)}
end
