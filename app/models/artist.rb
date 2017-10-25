class Artist < ApplicationRecord
  belongs_to :passport_country, class_name: 'Country', foreign_key: 'passport_country_id', optional: true
  belongs_to :company, optional: true
  belongs_to :tax, optional: true
  belongs_to :superannuation, optional: true
  belongs_to :bank_account, optional: true
  belongs_to :member
  has_many :artist_city
  has_many :city, through: :artist_city
  has_many :artist_medium
  has_many :medium, through: :artist_medium
  has_many :profile
  #validation
  validates_presence_of(:dob, :member)
end
