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
- [ ] calculate effort for custom messages (needs clarification)
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
