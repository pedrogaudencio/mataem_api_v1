class CouponSerializer < ActiveModel::Serializer
  attributes :id, :code, :value, :expiry_date, :order, :discount_type, :maximum_redeem_amount, :min_order_value, :app_type, :user_type, :restaurant
end
