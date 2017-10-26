class VendorCuisine < ApplicationRecord
  belongs_to :menu_item_cuisine
  belongs_to :vendor
end
