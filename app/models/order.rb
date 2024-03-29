class Order < ApplicationRecord
  enum status: { pending: 0, accepted: 1, rejected: 2 }
  enum progress_status: { pending_decision: 0,
                          accepted_order: 1,
                          out_for_delivery: 2,
                          delivered: 3,
                          closed: 4 }
  enum delivery_type: { delivery: 0, pickup: 1 }
  enum payment_type: { cod: 0, online: 1 }

  belongs_to :profile, optional: true
  belongs_to :area
  belongs_to :vendor
  has_many :order_items, dependent: :destroy
  has_one :order_assignment, dependent: :destroy
  has_one :coupon, dependent: :destroy

  before_save :update_replied_at, if: :status_changed?
  # before_save :set_profile
  # before_save :set_mobile_number
  # before_save :set_delivery_address
  after_create :calculate_total

  validates_presence_of :status, :progress_status, :delivery_type, :area, :vendor#, :mobile_number

  delegate :restaurant, to: :vendor

  # TODO: validate mobile number if not present then profile.mobile_number else raise
  # 

  # NOTE: add replied_by to track who updates the order progress status
  
  # update_finishing_time in controller

  def calculate_total
    t = self.order_items.sum(:price) + self.vendor.delivery_fee
    self.update(total: t)
    t
  end

  def apply_coupon
    if not self.coupon.nil? and self.coupon_is_valid?
      t = self.total
      if self.coupon.amount_based?
        t -= self.coupon.value
      elsif self.coupon.percentage_based?
        t -= t * self.coupon.value
      end
      t = 0 if t < 0
      self.update(total: t)
    end
  end

  def accept
    self.update(status: :accepted, progress_status: :accepted_order)
    UserMailer.order_processing(self.profile.user, self.id, :accept).deliver
  end

  def reject
    self.update(status: :rejected, progress_status: :closed)
    UserMailer.order_processing(self.profile.user, self.id, :reject).deliver
  end

  def mark_out_for_delivery
    self.update(progress_status: :out_for_delivery)
    UserMailer.order_processing(self.profile.user, self.id, :mark_out_for_delivery).deliver
  end

  def mark_delivered
    self.update(progress_status: :delivered)
  end

  def coupon_is_valid?
    return (self.coupon.valid_not_used? and
            self.coupon.valid_user_type? and
            self.coupon.valid_app_type? and
            self.coupon.valid_min_order_value? and
            self.coupon.valid_expiry_date? and
            self.coupon.valid_restaurant?)
  end

  private
    def update_replied_at
      self.replied_at = Time.now
    end

    def set_profile
      self.profile ||= @api_v1_current_user.profile
      # TODO: raise if not profile
      self.save!
    end

    def set_mobile_number
      self.mobile_number ||= @api_v1_current_user.profile.mobile_number
      # TODO: raise if not mobile_number
      self.save!
    end

    def set_delivery_address
      self.delivery_address ||= @api_v1_current_user.profile.address
      # TODO: raise if not address
      self.save!
    end

    def set_delivery_charges
      self.delivery_charges ||= self.vendor.delivery_fee
      # TODO: raise if not delivery_charges
      self.save!
    end
end
