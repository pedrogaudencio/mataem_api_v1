MenuItemCategory.create!([{ name: "Promotion" },
                          { name: "Value Meals" }])

MenuItemCuisine.create!([{ name: "Asian" },
                         { name: "American" }])

Restaurant.create!(name: "McDonald's")

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
               cuisine: MenuItemCuisine.second,
               category: MenuItemCategory.first)

Profile.create!(user_attributes: {email: "pmgaudencio@gmail.com",
                                  password: "qwertyuiop",
                                  password_confirmation: "qwertyuiop",
                                  confirmed_at: Time.now},
                first_name: "Pedro",
                last_name: "Gaudencio",
                mobile_number: "+351926613587",
                mobile_number_verified: true)
