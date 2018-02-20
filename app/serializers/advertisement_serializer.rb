class AdvertisementSerializer < ActiveModel::Serializer
  attributes :id, :title, :restaurant, :image, :size, :total_clicks, :start_date, :end_date, :restaurant_logo
  belongs_to :restaurant
  belongs_to :vendor

  def restaurant_logo
    object.restaurant.logo
  end
end
