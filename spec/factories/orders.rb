FactoryGirl.define do
  factory :order do
    profile ""
    mobile_number ""
    area ""
    vendor ""
    delivery_type ""
    finishing_time ""
    delivery_charges ""
    service_fee ""
    order_source ""
    progress_status ""
    delivery_address ""
    total 1.5
  end
end
