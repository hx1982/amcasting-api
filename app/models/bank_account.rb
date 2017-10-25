class BankAccount < ApplicationRecord
  #validation
  validates_presence_of(:bank_name, :bank_location,
    :account_name, :account_number)
end
