class ContactType < ApplicationRecord
  #validation
  validates_presence_of(:code, :name, :sequence)
end
