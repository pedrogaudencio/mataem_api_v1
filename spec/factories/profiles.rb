FactoryGirl.define do
  factory :profile do
    user nil
    mobile_number "MyString"
    mobile_number_verified false
    mobile_verification_code "MyString"
    address nil
    status 1
    loyalty_points 1
  end
end
