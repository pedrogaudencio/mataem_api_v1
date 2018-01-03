MenuItemCategory.create!([{ name: "Promotion" },
                          { name: "Value Meals" }])

MenuItemCuisine.create!([{ name: "Asian" },
                         { name: "American" }])

Restaurant.create!(name: "McDonald's")

# MenuItem.create!(vendor_id: 1
#                  name: "Name 1",
#                  description: "Description",
#                  ingredients: "Ingredients",
#                  price: 20,
#                  menu_item_category_id: 1,
#                  menu_item_cuisine_id: 1)

# MenuItem.create!(vendor_id: 1
#                  name: "Name 2",
#                  description: "Description",
#                  ingredients: "Ingredients",
#                  price: 10,
#                  menu_item_category_id: 1,
#                  menu_item_cuisine_id: 1)

# MenuItem.create!(vendor_id: 1
#                  name: "Name 3",
#                  description: "Description",
#                  ingredients: "Ingredients",
#                  price: 5,
#                  menu_item_category_id: 1,
#                  menu_item_cuisine_id: 1)

City.create!(name: "Evora")
Area.create!(name: "Area", city: City.first)
Address.create!(area: Area.first,
                street: "Street",
                number: "1")

Vendor.create!(name: "McDonald's Evora",
               restaurant: Restaurant.first,
               address: Address.first,
               delivery_time: 30,
               delivery_fee: 0,
               cuisines: [MenuItemCuisine.second],
               categories: [MenuItemCategory.first])

Profile.create!(user_attributes: {email: "pmgaudencio@gmail.com",
                                  password: "qwertyuiop",
                                  password_confirmation: "qwertyuiop",
                                  confirmed_at: Time.now},
                first_name: "Pedro",
                last_name: "Gaudencio",
                mobile_number: "+351926613587",
                mobile_number_verified: true)

# Order.create!(
#   order_items_attributes: [
#     {
#       quantity: 2,
#       menu_item_id: 1,
#       item_choice_variants: [],
#     },
#     {
#       quantity: 1,
#       menu_item_id: 2,
#       item_choice_variants: [],
#     },
#     {
#       quantity: 1,
#       menu_item_id: 3,
#       item_choice_variants: [],
#     }
#   ]
#   profile_id: 1,
#   area_id: 1,
#   vendor_id: 1,
#   delivery_type: 0,
#   order_source: 'postman',
# )
