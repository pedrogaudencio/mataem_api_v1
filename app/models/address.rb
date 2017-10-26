class Address < ApplicationRecord
  belongs_to :area, dependent: :destroy
  belongs_to :profile, optional: true
  belongs_to :vendor, optional: true
  accepts_nested_attributes_for :area

  enum address_type: { apartment: 0, house: 1, office: 2 }

  validates_presence_of :area, :address_type, :street, :number
  validates :number, :numericality => { :greater_than_or_equal_to => 0 }
  validates_associated :area

  delegate :city, to: :area
end
