class ProfileResume < ApplicationRecord
  belongs_to :profile
  has_many :resume_section
  #validation
  validates_presence_of :profile
end
