class City < ApplicationRecord
  belongs_to :state
  #validations
  validates_presence_of :name, :state
end
