class Address < ApplicationRecord
  belongs_to :area
  belongs_to :profile, optional: true
  belongs_to :vendor, optional: true
  accepts_nested_attributes_for :area

  enum address_type: { apartment: 0, house: 1, office: 2 }

  validates_presence_of :area, :address_type, :street, :number
  validates :number, :numericality => { :greater_than_or_equal_to => 0 }
  validates_associated :area

  delegate :city, to: :area

  translates :building,
             :number,
             :street,
             :floor, fallbacks_for_empty_translations: true
end
