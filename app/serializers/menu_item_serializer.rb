class MenuItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :ingredients, :price, :menu_item_category, :menu_item_cuisine
  belongs_to :vendor
  belongs_to :menu_item_category
  belongs_to :menu_item_cuisine
end
