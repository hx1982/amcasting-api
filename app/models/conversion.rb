class Conversion < ApplicationRecord
  belongs_to :profile_item_type

  #validation
  validates_presence_of(:profile_item_type,
    :profile_item_type_code, :sequence)
end
