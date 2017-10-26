class AreaSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude, :status
  has_one :city
end
