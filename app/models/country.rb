class Country < ApplicationRecord
  has_many :states, dependent: :destroy

  #validations
  validates_presence_of :name, :country_code
end
