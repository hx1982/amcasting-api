class ResumeSection < ApplicationRecord
  belongs_to :profile_resume
  has_many :resume_table_cell, dependent: :destroy
  has_many :resume_table_medium, dependent: :destroy
end
