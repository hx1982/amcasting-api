class MemberPackage < ApplicationRecord
  belongs_to :package
  belongs_to :member
  has_many :member_package_item
end
