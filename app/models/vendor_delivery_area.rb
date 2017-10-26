class VendorDeliveryArea < ApplicationRecord
  belongs_to :area
  belongs_to :vendor
end
