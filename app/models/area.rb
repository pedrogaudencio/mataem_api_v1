class Area < ApplicationRecord
  belongs_to :city
  has_many :vendor_delivery_areas
  has_many :vendors, through: :vendor_delivery_areas
  accepts_nested_attributes_for :city
  
  enum status: { active: 0, inactive: 1 }

  validates_presence_of :name, :status, :city
  validates_associated :city
end
