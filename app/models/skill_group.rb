class SkillGroup < ApplicationRecord
  has_many :skill

  validates_presence_of :name, :sequence
end
