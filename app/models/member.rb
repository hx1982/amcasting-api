class Member < ApplicationRecord
  belongs_to :member_type
  belongs_to :member_source_type
  belongs_to :account_status_type
  belongs_to :user
  has_many :member_address
  has_many :member_contact
  has_many :member_social
  has_one :artist
  has_many :artist_package

  #validation
  validates_presence_of :first_name, :last_name, :gender_code,
    :member_type, :member_source_type, :account_status_type,
    :user

  def full_name
    [first_name, middle_name, last_name].select(&:present?).join(' ').titleize
  end
end
