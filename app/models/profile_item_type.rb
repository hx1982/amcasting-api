class ProfileItemType < ApplicationRecord
  has_one :profile_range_item_type_value
  has_many :profile_value_item_type_value
  has_many :conversion

  #validation
  validates_presence_of :code, :name, :value_code,
    :sequence
end
