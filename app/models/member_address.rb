class MemberAddress < ApplicationRecord
  belongs_to :address, dependent: :destroy
  belongs_to :member

  #validation
  validates_presence_of :member
end
