class VendorSerializer < ActiveModel::Serializer
  attributes :id, :name, :preorder, :pickup, :delivery_fee, :delivery_time, :status, :menu_items, :delivery_areas, :busy
  belongs_to :address
  belongs_to :restaurant
  has_many :menu_items
  has_many :cuisines
  has_many :categories
  has_many :delivery_areas
  # has_many :orders
  has_many :reviews

  def attributes(*args)
    hash = super
    hash[:menu_items] = hash[:menu_items].includes(:menu_item_cuisine).as_json(include: [:menu_item_cuisine], methods: :image_path) if hash[:menu_items].present?
    hash
  end
end
