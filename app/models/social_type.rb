class SocialType < ApplicationRecord
  #validation
  validates_presence_of(:name, :code, :sequence)
end
