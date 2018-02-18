class AddressSerializer < ActiveModel::Serializer
  attributes :id, :address_type, :building, :number, :street, :floor, :profile, :area, :latitude, :longitude
  has_one :area
  belongs_to :profile
end
