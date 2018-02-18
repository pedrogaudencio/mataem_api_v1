class AdvertisementSerializer < ActiveModel::Serializer
  attributes :id, :title, :restaurant, :image, :size, :total_clicks, :start_date, :end_date
  belongs_to :restaurant
  belongs_to :vendor
end
