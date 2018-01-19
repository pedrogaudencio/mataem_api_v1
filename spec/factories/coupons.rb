FactoryGirl.define do
  factory :coupon do
    code ""
    value ""
    expiry_date ""
    order ""
    discount_type ""
    maximum_redeem_amount ""
    min_order_value ""
    app_type ""
    user_type 1
  end
end
