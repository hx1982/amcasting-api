class MemberSocial < ApplicationRecord
  belongs_to :member
  belongs_to :social_type
end
