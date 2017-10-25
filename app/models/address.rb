class Address < ApplicationRecord
  belongs_to :address_location_type
  belongs_to :address_type
  belongs_to :country, optional: true
  belongs_to :state, optional: true
  belongs_to :city, optional: true

  #validate_presence_of
  validates_presence_of(:address_location_type, :address_type, :country, :state )
end
