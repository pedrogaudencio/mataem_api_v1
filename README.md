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
- delivery boy and business permissions
- internationalization
- generate api documentation
- generate database schema diagram

1. criar Order
2. criar Order mais complexo com variações de menu_items
3. escrever POST para criar Order


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
