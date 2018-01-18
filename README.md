# api-v1
API Endpoint

## TO DO:

- finish modules:
  - Coupons
  - Ads
  - Billing
  - Payment (?)
  - Reports generation

Needs testing:
- permissions
https://github.com/ryanb/cancan/wiki/Defining-Abilities

Final configurations missing:

1. item_choice_variants

1. finish Ads and Coupons API endpoints

1. finish API endpoints
  Ads
  1. gerar model
  2. escrever POST para criar Ad

  Coupons
  1. gerar model
  2. escrever POST para criar Coupon
  3. invalidar após uso na Order
  4. aplicar desconto na Order


  Billing
  1. gerar model
  2. escrever POST para criar Billing
  3. gerar Payment (comentar)
  
  Payment (?)
  * still waiting on the client to decide

  Reports generation
  1. https://docs.google.com/spreadsheets/d/1gYEBMPYlCPyYfM2uzXgJu-FGGWubGfIX2su69CWoaVQ/edit#gid=1962083908

  check user scope folder

2. calculate time for loyalty points (need to check the front-end first)
3. translations for Arabic
4. push notifications (need more details on what to notify the customer about)
5. reports (need more details)
6. check QPAY payments integration (wait for @kutten to reply)

[ ] delivery boy and business permissions, check guest
[ ] internationalization https://github.com/globalize/globalize
[ ] generate api documentation -> ApiPie
[x] generate database schema diagram -> EDR

[ ] autenticar user
https://github.com/lynndylanhurley/devise_token_auth/issues/75
https://github.com/lynndylanhurley/devise_token_auth#controller-methods
[ ] assign profile
[ ] uncomment order profile/mobile stuff
[ ] criar order baseada no @current_user.profile
