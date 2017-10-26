FactoryGirl.define do
  factory :vendor do
    name "MyString"
    address nil
    restaurant nil
    preorder false
    pickup false
    delivery_fee 1.5
    delivery_time 1
    status 1
    cuisine nil
    category nil
  end
end
