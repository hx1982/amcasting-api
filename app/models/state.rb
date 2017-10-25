class State < ApplicationRecord
  belongs_to :country
  has_many :cities, dependent: :destroy

  #validations
  validates_presence_of :name
end
