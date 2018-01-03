# api-v1
API Endpoint

## TO DO:

- fix the bugs in the orders
- finish modules:
  - Order Assignments/Issues
  - Coupons
  - Ads
  - Reports generation

Needs testing:
- permissions
https://github.com/ryanb/cancan/wiki/Defining-Abilities

Final configurations missing:

1. finish Order Assignment/Issue, Coupons, Ads API endpoints

1. finish API endpoints
  Order Assignments
  1. get Orders that are pending assignment
  2. escrever OrderAssignment para aquele order

  OrderIssues
  1. get OrderIssue para certa Order
  2. escrever POST para criar OrderIssue

  Ads
  1. gerar model
  2. escrever POST para criar Ad

  Coupons
  1. gerar model
  2. escrever POST para criar Coupon
  3. invalidar após uso na Order
  4. aplicar desconto na Order

  Reports generation
  1. ?

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
[ ] assign profile
[ ] uncomment order profile/mobile stuff
[ ] criar order baseada no @current_user.profile
