FactoryGirl.define do
  factory :restaurant do
    name "MyString"
    order_packaging_avg 1.5
    value_for_money_avg 1.5
    delivery_time_avg 1.5
    food_quality_avg 1.5
    status 1
    featured false
    sort_order 1
  end
end
