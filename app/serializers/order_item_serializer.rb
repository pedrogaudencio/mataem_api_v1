class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :price, :menu_item
  has_one :order
  has_one :menu_item
  has_one :item_choice
  has_one :item_choice_variant
end
