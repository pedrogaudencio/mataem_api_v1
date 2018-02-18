class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :order_packaging, :value_for_money, :delivery_time, :food_quality, :profile
  has_one :vendor
  has_one :user

  def profile
    object.user.try(:profile)
  end
end
