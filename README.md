# api-v1
API Endpoint

## TO DO:

- [x] internationalization https://github.com/globalize/globalize
- [x] generate database schema diagram -> EDR
- [ ] [reports](https://docs.google.com/spreadsheets/d/1gYEBMPYlCPyYfM2uzXgJu-FGGWubGfIX2su69CWoaVQ/edit#gid=1962083908): waiting on data
- [ ] push notifications (onesignal.com): waiting on config
- [ ] authenticate user [1](https://github.com/lynndylanhurley/devise_token_auth/issues/75) [2](https://github.com/lynndylanhurley/devise_token_auth#controller-methods)
- [ ] include auth example in PostMan [1](https://www.getpostman.com/docs/postman/sending_api_requests/authorization) [2](https://medium.com/devtechtipstricks/build-a-simple-rails-api-server-auth0-jwt-authentication-react-from-scratch-in-30-minutes-or-257cbb2a939a)
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
- [ ] get total amount for user (joining all orders)
- [ ] restaurant enum payment_type: { payment_both: 0, cod: 1, online: 2 }
- [ ] vendor busy bool field
- [ ] vendor minimum_order_value field
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
- [ ] include coupon code in order and ignore if restaurant_id from coupon is not ==
- [ ] list options to include in post requests (like active/inactive instead of 0/1), waiting for list

3. Later

- [ ] mailchimp emails
- [ ] redeem cookies/loyalty points
- [ ] several working hours per day
- [ ] crop images automatically
