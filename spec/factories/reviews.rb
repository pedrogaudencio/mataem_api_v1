FactoryGirl.define do
  factory :review do
    vendor nil
    rating 1.5
    comment "MyString"
    user nil
    order_packaging 1
    value_for_money 1
    delivery_time 1
    food_quality 1
  end
end
