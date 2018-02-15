class VendorSerializer < ActiveModel::Serializer
  attributes :id, :name, :preorder, :pickup, :delivery_fee, :delivery_time, :status, :menu_items, :delivery_areas
  belongs_to :address
  belongs_to :restaurant
  has_many :menu_items
  has_many :cuisines
  has_many :categories
  has_many :delivery_areas
  # has_many :orders
  has_many :reviews
end
