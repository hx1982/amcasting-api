class ProfileSkill < ApplicationRecord
  belongs_to :profile
  belongs_to :skill

  #validtaion
  validates_presence_of :profile, :skill, :level
end
