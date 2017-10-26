class AddressSerializer < ActiveModel::Serializer
  attributes :id, :address_type, :building, :number, :street, :floor
  has_one :area
end
