class MenuItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :ingredients, :price
  belongs_to :vendor
  belongs_to :menu_item_category
  belongs_to :menu_item_cuisine
end
