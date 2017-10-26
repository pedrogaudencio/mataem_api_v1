class MenuItemCategory < ApplicationRecord
  has_many :menu_items
  has_many :vendor_categories
  has_many :vendors, through: :vendor_categories

  enum status: { active: 0, inactive: 1 }

  validates_presence_of :name, :status

  after_create :assign_sort_order

  def assign_sort_order
    if not self.sort_order
      self.sort_order = MenuItemCategory.maximum(:sort_order).to_i + 1
      self.save
    end
  end
end
