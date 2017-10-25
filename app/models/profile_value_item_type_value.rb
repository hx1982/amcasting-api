class ProfileValueItemTypeValue < ApplicationRecord
  belongs_to :profile_item_type

  #validation
  validates_presence_of :name,
    :profile_item_type, :profile_item_type_code
end
