class OrderSerializer < ActiveModel::Serializer
  attributes :id, :profile, :mobile_number, :area, :vendor, :status, :delivery_type, :finishing_time, :delivery_charges, :service_fee, :order_source, :progress_status, :delivery_address, :total
  belongs_to :profile
  belongs_to :area
  belongs_to :restaurant
  belongs_to :vendor
  has_many :order_items
  has_one :order_assignment
  has_one :coupon
end
