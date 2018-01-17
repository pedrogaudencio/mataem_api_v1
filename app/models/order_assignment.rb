class OrderAssignment < ApplicationRecord
  enum status: { pending: 0, accepted: 1 }

  belongs_to :user, optional: true
  belongs_to :order

  scope :pending_from_vendor, -> (vendor_id) {
    where(status: :pending, order: Order.where(vendor: vendor_id))
  }
end
