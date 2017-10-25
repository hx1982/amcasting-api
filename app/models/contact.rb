class Contact < ApplicationRecord
  belongs_to :contact_type

  #validation
  validates_presence_of(:email, :phone,
    :contact_type)
end
