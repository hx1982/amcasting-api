class Skill < ApplicationRecord
  belongs_to :skill_group

  validates_presence_of :name, :sequence
end
