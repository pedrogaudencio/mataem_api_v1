# api-v1
API Endpoint

## TO DO:

- [x] internationalization https://github.com/globalize/globalize
- [x] generate database schema diagram -> EDR
- [ ] [reports](https://docs.google.com/spreadsheets/d/1gYEBMPYlCPyYfM2uzXgJu-FGGWubGfIX2su69CWoaVQ/edit#gid=1962083908): waiting on data
- [ ] [test translation](https://docs.google.com/spreadsheets/d/1oN2NLgIkyCg-ktx8lAUaIVCPz12uwEeNTABuSeEQdhc/edit#gid=993493138)
- [x] assign profile
- [ ] uncomment order profile/mobile stuff
- [ ] [user permissions](https://github.com/ryanb/cancan/wiki/Defining-Abilities)
- [ ] generate api documentation -> ApiPie
- [ ] change MenuItems to restaurant instead of vendor? (needs clarification)

### Models: finish API endpoints

##  Coupons

  1. mark as used after order payment
  2. uncomment validations:
    - valid_user_type
    - valid_app_type
    - valid_min_order_value
    - valid_expiry_date

##  Billing (?)
  1. model
  2. POST request example on PostMan
  3. generate Payment from Billing

##  Payment (?)
  - check QPAY payments integration: still waiting for @kutten to reply

## Bugfix

- [ ] `item_choice_variants:[1,2,3]` this field doesnt affect get result `/orders`
- [ ] for item choices some are single aelect some are multi select so expect a field for it in item_choice (eg :https://www.talabat.com/qatar/restaurant/16326/pizza-hut--barwa-village check pizza)
- [ ] delete `/profiles/1` 500 internal server error (edited)

## Feature updates

1. Superuser

- [x] restaurant restaurant_type {veg, non-veg, both}
- [x] restaurant payment_type {cod, online, both}
- [x] restaurant add description field
- [x] address add latitude, longitude fields
- [x] profile gender field {male, female}
- [x] profile date of birth
- [x] {large banner, small banner} option in advertisement, add vendor_id column
- [x] get all restaurants, send user owner data details together
- [x] restaurant enum payment_type: { payment_both: 0, cod: 1, online: 2 }
- [x] vendor busy bool field
- [x] vendor minimum_order_value field
- [ ] get total amount for user (joining all orders)
- [ ] endpoint most most selling items for each restaurant and whole mataem

2. Customer

- [x] include image_url in order items
- [x] include profile in order assignments
- [x] include area details in address
- [x] order payment_type {cod, online}
- [x] order description
- [x] featured restaurants endpoint
- [x] advertisement start_date, end_date
- [x] order delivery_datetime
- [x] send user_id in review
- [x] get coupon value + valid + restaurant_id (if any) by code
- [x] include coupon code in order and ignore if restaurant_id from coupon is not equal (or coupon is not valid)
- [x] add filter for categories + cuisines + delivery_area in vendors
- [ ] fix vendor cagetories filter
- [x] add filter for vendor busy or not
- [x] update the vendor is busy or not
- [ ] average reviews in get_all_vendors
- [ ] FIX: post /vendors/8/orders, without coupon id ,the order items is empty on get result
- [ ] FIX: /reviews empty
- [ ] in coupons api ,there is no logo and bg_image url under restaurant object
- [ ] push notifications (onesignal.com): https://onesignal.com/apps/a18f72c1-0a22-4ea6-b45b-3f65976e05dc/settings#tab_platforms
- [ ] facebook auth [1](https://www.getpostman.com/docs/postman/sending_api_requests/authorization) [2](https://medium.com/devtechtipstricks/build-a-simple-rails-api-server-auth0-jwt-authentication-react-from-scratch-in-30-minutes-or-257cbb2a939a)

3. Extra
- [ ] mailchimp emails
- [ ] redeem cookies/loyalty points
- [ ] endpoint to redeem loyalty point

4. Later
- [ ] several working hours per day
- [ ] crop images automatically
