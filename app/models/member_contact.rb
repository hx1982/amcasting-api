class MemberContact < ApplicationRecord
  belongs_to :contact, dependent: :destroy
  belongs_to :member

  #validation
  validates_presence_of :member, :contact

end
