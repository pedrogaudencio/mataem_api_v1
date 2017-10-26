class ItemChoiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :status, :limit_date_from, :limit_date_until, :max_variants
  has_one :menu_item
  has_many :variants
end
