class AdvertisementSerializer < ActiveModel::Serializer
  attributes :id, :title, :restaurant, :image, :total_clicks
end
