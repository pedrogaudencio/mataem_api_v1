FactoryGirl.define do
  factory :order_item do
    order nil
    quantity 1
    menu_item nil
    item_choice nil
    item_choice_variant nil
    price 1.5
  end
end
