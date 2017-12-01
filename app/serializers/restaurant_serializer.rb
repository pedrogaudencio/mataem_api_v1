class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :order_packaging_avg, :value_for_money_avg, :delivery_time_avg, :food_quality_avg, :status, :featured, :sort_order, :opening_hours, :closing_hours, :weekdays, :is_open
  has_many :vendors
  has_one :social_media
end
