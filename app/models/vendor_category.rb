class VendorCategory < ApplicationRecord
  belongs_to :menu_item_category
  belongs_to :vendor
end
