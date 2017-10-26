FactoryGirl.define do
  factory :item_choice do
    menu_item nil
    name "MyString"
    price 1.5
    available false
    limit_date_from "2017-10-30 01:07:49"
    limit_date_until "2017-10-30 01:07:49"
    max_variants 1
  end
end
