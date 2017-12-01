require 'profile_helper'

class Profile < ApplicationRecord
  belongs_to :user
  has_one :address
  accepts_nested_attributes_for :address, :user
  default_scope { :active }

  enum status: { active: 0, inactive: 1, blocked: 2 }

  validates_presence_of :user, :first_name, :last_name, :mobile_number
  validates :loyalty_points, :numericality => { :greater_than_or_equal_to => 0 }
  validates_associated :user, :address

  after_create :generate_mobile_code

  scope :active, -> { where(status: 0) }
  scope :inactive, -> { where(status: 1) }
  scope :blocked, -> { where(status: 2) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def generate_mobile_code
    if not self.mobile_number_verified
      self.mobile_verification_code = rand.to_s[2..7]
      self.save!
    end
    self.mobile_verification_code
  end

  def send_sms_code
    send_sms(self.mobile_number, self.mobile_verification_code)
  end

  # TODO: create user at profile creation
end
