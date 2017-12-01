class Vendor < ApplicationRecord
  enum status: { active: 0, inactive: 1 }

  belongs_to :address
  belongs_to :restaurant
  has_many :vendor_cuisines
  has_many :vendor_categories
  has_many :cuisines, through: :vendor_cuisines, source: :menu_item_cuisine
  has_many :categories, through: :vendor_categories, source: :menu_item_category
  has_many :menu_items
  has_many :vendor_delivery_areas
  has_many :delivery_areas, through: :vendor_delivery_areas, source: :area
  has_many :orders
  has_many :reviews

  validates_presence_of :name, :address, :restaurant, :delivery_time

  # TODO: test these filters
  scope :just_opened, -> { where('created_at >= ?', 1.month.ago) }
  scope :free_delivery, -> { where(delivery_fee: 0) }
  scope :with_cuisines, -> (cuisines) {
    MenuItemCuisine.where(name: cuisines).first.vendors
  }
  scope :with_categories, -> (categories) {
    MenuItemCategory.where(name: categories).first.vendors
  }
  scope :delivers_in, -> (area) {
    Area.where(name: area).first.vendors
  }

  def delivers_in?(area)
    !!self.where(delivery_areas: :area)
  end
end
