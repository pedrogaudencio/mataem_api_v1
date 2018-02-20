class Coupon < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :restaurant, optional: true

  enum discount_type: { amount_based: 0, percentage_based: 1 }
  enum app_type: { web: 0, mobile: 1, both_apps: 2 }
  enum user_type: { first_time: 0, not_specified: 1 }
  enum status: { active: 0, inactive: 1 }

  after_save :generate_code, :recalculate_order
  # after_destroy :recalculate_order

  validates_presence_of :value, :discount_type, :app_type, :user_type
  # validate valid_user_type?, valid_app_type?, valid_min_order_value?, valid_expiry_date?

  # validate
  # discount_type
  # maximum_redeem_amount

  def mark_as_used
    self.update(status: 1)
  end

  # def is_valid_from_order?
  #   return self.valid_not_used? and
  #           self.valid_user_type?(self.order.try("profile.user")) and
  #           self.valid_app_type?(self.order.try(:source)) and
  #           self.valid_min_order_value?(self.order.total) and
  #           self.valid_expiry_date?
  # end

  def valid_not_used?
    return self.active?
  end

  def valid_user_type?
    if self.first_time? and self.order.profile
      return Order.where(profile: self.order.profile).empty?
    end
    return true
  end

  def valid_restaurant?
    if not self.restaurant.nil?
      return self.restaurant == self.order.vendor.restaurant
    end
    return true
  end

  def valid_app_type?
    if not self.both_apps?
      return self.app_type == self.order.order_source
    end
    return true
  end

  def valid_min_order_value?
    if not (self.min_order_value.nil? or self.min_order_value.zero?)
      return self.min_order_value >= self.order.total
    end
    return true
  end

  def valid_expiry_date?
    if not self.expiry_date.nil?
      return self.expiry_date >= Date.today
    end
    return true
  end

  private
    def generate_code
      if not self.code
        self.code = Array.new(10) { Array('A'..'Z').sample }.join
        self.save!
      end
      self.code
    end

    def recalculate_order
      if not self.order.nil? and not self.order.total.nil?
        self.order.calculate_total
      end
    end
end
