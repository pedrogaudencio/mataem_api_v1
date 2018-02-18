class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :price, :menu_item, :menu_item_image
  has_one :order
  has_one :menu_item
  has_one :menu_item_image
  has_one :item_choice
  has_one :item_choice_variant

  def menu_item_image
    object.menu_item.image.url
  end
end
