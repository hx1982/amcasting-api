class MediumDetail < ApplicationRecord
  belongs_to :medium
  has_one :audio_detail, dependent: :destroy
end
