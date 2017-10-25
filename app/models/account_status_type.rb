class AccountStatusType < ApplicationRecord

  #validation
  validates_presence_of(:name, :code, :sequence)
end
