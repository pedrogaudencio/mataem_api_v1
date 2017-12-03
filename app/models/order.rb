class Order < ApplicationRecord
  enum status: { pending: 0, accepted: 1, rejected: 2 }
  enum progress_status: { pending_decision: 0,
                          accepted_order: 1,
                          out_for_delivery: 2,
                          delivered: 3,
                          closed: 4 }
  enum delivery_type: { delivery: 0, pickup: 1 }

  belongs_to :profile
  belongs_to :area
  belongs_to :restaurant
  belongs_to :vendor
  has_many :order_items
  has_one :order_assignment
  # has_one :coupon

  before_save :update_replied_at, if: :status_changed?
  after_create :calculate_total

  validates_presence_of :profile, :status, :progress_status, :delivery_type, :area, :vendor, :restaurant, :mobile_number, :delivery_address

  # NOTE: add replied_by to track who updates the order progress status
  
  # update_finishing_time in controller

  def calculate_total
    total = self.order_items.sum(:price) + self.service_fee
    total -= self.coupon.value if self.coupon
    total = 0 if total < 0
    self.update(total: total)
  end

  def accept
    self.update(status: :accepted, progress_status: :accepted_order)
  end

  def reject
    self.update(status: :rejected, progress_status: :closed)
  end

  def mark_out_for_delivery
    self.update(progress_status: :out_for_delivery)
    # send notification to user
  end

  def mark_delivered
    self.update(progress_status: :delivered)
  end

  private
    def update_replied_at
      self.replied_at = Time.now
      self.save!
    end

    def set_mobile_number
      self.mobile_number ||= self.user.profile.mobile_number
      self.save!
    end

    def set_delivery_address
      self.delivery_address ||= self.user.profile.address
      self.save!
    end

    def set_restaurant
      self.restaurant ||= self.vendor.restaurant
      self.save!
    end

    def set_delivery_charges
      self.delivery_charges ||= self.vendor.delivery_fee
      self.save!
    end
end
