class OrderSerializer < ActiveModel::Serializer
  attributes :id, :profile, :mobile_number, :area, :vendor, :status, :delivery_type, :finishing_time, :delivery_charges, :service_fee, :order_source, :progress_status, :delivery_address, :total
  has_many :order_items

  # delegate :status, to: :scope
  # delegate :progress_status, to: :scope
  # delegate :delivery_type, to: :scope

  # def status
  #   return scope[:status]
  # end

  # def progress_status
  #   return scope[:progress_status]
  # end

  # def delivery_type
  #   return scope[:delivery_type]
  # end
end
