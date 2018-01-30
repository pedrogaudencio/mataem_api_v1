class AdvertisementSerializer < ActiveModel::Serializer
  attributes :id, :title, :restaurant, :total_clicks
end
