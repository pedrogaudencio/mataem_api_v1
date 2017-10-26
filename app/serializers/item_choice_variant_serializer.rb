class ItemChoiceVariantSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
  has_one :item_choice
end
