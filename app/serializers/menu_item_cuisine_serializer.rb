class MenuItemCuisineSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :sort_order
  # NOTE: check if the request isn't too heavy including the menu items
  # has_many :menu_items
  has_many :vendors  
end
