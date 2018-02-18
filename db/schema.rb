# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180218173240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_translations", force: :cascade do |t|
    t.integer "address_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "building"
    t.string "number"
    t.string "street"
    t.string "floor"
    t.index ["address_id"], name: "index_address_translations_on_address_id"
    t.index ["locale"], name: "index_address_translations_on_locale"
  end

  create_table "addresses", force: :cascade do |t|
    t.integer "address_type", default: 0
    t.string "building"
    t.string "number"
    t.string "street"
    t.string "floor"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_id"
    t.string "latitude"
    t.string "longitude"
    t.index ["area_id"], name: "index_addresses_on_area_id"
    t.index ["profile_id"], name: "index_addresses_on_profile_id"
  end

  create_table "advertisement_translations", force: :cascade do |t|
    t.integer "advertisement_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["advertisement_id"], name: "index_advertisement_translations_on_advertisement_id"
    t.index ["locale"], name: "index_advertisement_translations_on_locale"
  end

  create_table "advertisements", force: :cascade do |t|
    t.string "title"
    t.bigint "restaurant_id"
    t.integer "total_clicks", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "size"
    t.bigint "vendor_id"
    t.date "start_date"
    t.date "end_date"
    t.index ["restaurant_id"], name: "index_advertisements_on_restaurant_id"
    t.index ["vendor_id"], name: "index_advertisements_on_vendor_id"
  end

  create_table "answer_translations", force: :cascade do |t|
    t.integer "answer_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "text"
    t.index ["answer_id"], name: "index_answer_translations_on_answer_id"
    t.index ["locale"], name: "index_answer_translations_on_locale"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.string "text"
    t.integer "sort_order"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "area_translations", force: :cascade do |t|
    t.integer "area_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["area_id"], name: "index_area_translations_on_area_id"
    t.index ["locale"], name: "index_area_translations_on_locale"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id"
    t.string "latitude"
    t.string "longitude"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_areas_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "city_translations", force: :cascade do |t|
    t.integer "city_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["city_id"], name: "index_city_translations_on_city_id"
    t.index ["locale"], name: "index_city_translations_on_locale"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "code"
    t.float "value", default: 0.0
    t.datetime "expiry_date"
    t.bigint "order_id"
    t.integer "discount_type", default: 0
    t.float "maximum_redeem_amount"
    t.float "min_order_value", default: 0.0
    t.integer "app_type", default: 2
    t.integer "user_type", default: 1
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_coupons_on_order_id"
  end

  create_table "enquiries", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "email"
    t.string "mobile_number"
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_enquiries_on_user_id"
  end

  create_table "item_choice_translations", force: :cascade do |t|
    t.integer "item_choice_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["item_choice_id"], name: "index_item_choice_translations_on_item_choice_id"
    t.index ["locale"], name: "index_item_choice_translations_on_locale"
  end

  create_table "item_choice_variant_translations", force: :cascade do |t|
    t.integer "item_choice_variant_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["item_choice_variant_id"], name: "index_8748ef9b10ae361e158e724840f33271dc455bf8"
    t.index ["locale"], name: "index_item_choice_variant_translations_on_locale"
  end

  create_table "item_choice_variants", force: :cascade do |t|
    t.bigint "item_choice_id"
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_choice_id"], name: "index_item_choice_variants_on_item_choice_id"
  end

  create_table "item_choices", force: :cascade do |t|
    t.bigint "menu_item_id"
    t.string "name"
    t.float "price"
    t.integer "status", default: 0
    t.datetime "limit_date_from"
    t.datetime "limit_date_until"
    t.integer "max_variants"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_item_choices_on_menu_item_id"
  end

  create_table "menu_item_categories", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.integer "sort_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_item_category_translations", force: :cascade do |t|
    t.integer "menu_item_category_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["locale"], name: "index_menu_item_category_translations_on_locale"
    t.index ["menu_item_category_id"], name: "index_menu_item_category_translations_on_menu_item_category_id"
  end

  create_table "menu_item_cuisine_translations", force: :cascade do |t|
    t.integer "menu_item_cuisine_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["locale"], name: "index_menu_item_cuisine_translations_on_locale"
    t.index ["menu_item_cuisine_id"], name: "index_menu_item_cuisine_translations_on_menu_item_cuisine_id"
  end

  create_table "menu_item_cuisines", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.integer "sort_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_item_translations", force: :cascade do |t|
    t.integer "menu_item_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "description"
    t.string "ingredients"
    t.index ["locale"], name: "index_menu_item_translations_on_locale"
    t.index ["menu_item_id"], name: "index_menu_item_translations_on_menu_item_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "ingredients"
    t.float "price"
    t.bigint "menu_item_category_id"
    t.bigint "menu_item_cuisine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "vendor_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["menu_item_category_id"], name: "index_menu_items_on_menu_item_category_id"
    t.index ["menu_item_cuisine_id"], name: "index_menu_items_on_menu_item_cuisine_id"
    t.index ["vendor_id"], name: "index_menu_items_on_vendor_id"
  end

  create_table "order_assignment_issues", force: :cascade do |t|
    t.bigint "order_id"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_assignment_issues_on_order_id"
  end

  create_table "order_assignments", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "user_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_assignments_on_order_id"
    t.index ["user_id"], name: "index_order_assignments_on_user_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.integer "quantity"
    t.bigint "menu_item_id"
    t.integer "item_choice_variants", default: [], array: true
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_order_items_on_menu_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "area_id"
    t.bigint "vendor_id"
    t.integer "status", default: 0
    t.string "mobile_number"
    t.integer "delivery_type", default: 0
    t.integer "finishing_time", default: 0
    t.float "delivery_charges", default: 0.0
    t.float "service_fee", default: 0.0
    t.string "order_source"
    t.datetime "replied_at"
    t.integer "progress_status", default: 0
    t.string "delivery_address"
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_type", default: 0
    t.string "description"
    t.datetime "delivery_datetime"
    t.index ["area_id"], name: "index_orders_on_area_id"
    t.index ["profile_id"], name: "index_orders_on_profile_id"
    t.index ["vendor_id"], name: "index_orders_on_vendor_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_number"
    t.boolean "mobile_number_verified", default: false
    t.string "mobile_verification_code"
    t.bigint "address_id"
    t.integer "status", default: 0
    t.integer "loyalty_points", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_id"
    t.integer "gender"
    t.date "date_of_birth"
    t.index ["address_id"], name: "index_profiles_on_address_id"
    t.index ["restaurant_id"], name: "index_profiles_on_restaurant_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "question_translations", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "text"
    t.index ["locale"], name: "index_question_translations_on_locale"
    t.index ["question_id"], name: "index_question_translations_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.integer "sort_order"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurant_translations", force: :cascade do |t|
    t.integer "restaurant_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["locale"], name: "index_restaurant_translations_on_locale"
    t.index ["restaurant_id"], name: "index_restaurant_translations_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.float "order_packaging_avg"
    t.float "value_for_money_avg"
    t.float "delivery_time_avg"
    t.float "food_quality_avg"
    t.integer "status", default: 0
    t.boolean "featured", default: false
    t.integer "sort_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.string "opening_hours"
    t.string "closing_hours"
    t.integer "weekdays", default: [], array: true
    t.string "bg_image_file_name"
    t.string "bg_image_content_type"
    t.integer "bg_image_file_size"
    t.datetime "bg_image_updated_at"
    t.integer "restaurant_type", default: 0
    t.integer "payment_type", default: 0
    t.string "description"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "vendor_id"
    t.bigint "user_id"
    t.integer "status", default: 0
    t.float "rating"
    t.string "comment"
    t.integer "order_packaging"
    t.integer "value_for_money"
    t.integer "delivery_time"
    t.integer "food_quality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["vendor_id"], name: "index_reviews_on_vendor_id"
  end

  create_table "social_media", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.string "facebook_url"
    t.string "twitter_url"
    t.string "google_plus_url"
    t.string "linkedin_url"
    t.string "facebook_app_id"
    t.string "facebook_secret_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_social_media_on_restaurant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "vendor_categories", force: :cascade do |t|
    t.bigint "menu_item_category_id"
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_category_id"], name: "index_vendor_categories_on_menu_item_category_id"
    t.index ["vendor_id"], name: "index_vendor_categories_on_vendor_id"
  end

  create_table "vendor_cuisines", force: :cascade do |t|
    t.bigint "menu_item_cuisine_id"
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_cuisine_id"], name: "index_vendor_cuisines_on_menu_item_cuisine_id"
    t.index ["vendor_id"], name: "index_vendor_cuisines_on_vendor_id"
  end

  create_table "vendor_delivery_areas", force: :cascade do |t|
    t.bigint "area_id"
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_vendor_delivery_areas_on_area_id"
    t.index ["vendor_id"], name: "index_vendor_delivery_areas_on_vendor_id"
  end

  create_table "vendor_translations", force: :cascade do |t|
    t.integer "vendor_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["locale"], name: "index_vendor_translations_on_locale"
    t.index ["vendor_id"], name: "index_vendor_translations_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.bigint "address_id"
    t.bigint "restaurant_id"
    t.boolean "preorder"
    t.boolean "pickup"
    t.float "delivery_fee", default: 0.0
    t.integer "delivery_time"
    t.integer "status", default: 0
    t.bigint "cuisines_id"
    t.bigint "categories_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_vendors_on_address_id"
    t.index ["categories_id"], name: "index_vendors_on_categories_id"
    t.index ["cuisines_id"], name: "index_vendors_on_cuisines_id"
    t.index ["restaurant_id"], name: "index_vendors_on_restaurant_id"
  end

  add_foreign_key "addresses", "areas"
  add_foreign_key "addresses", "profiles"
  add_foreign_key "advertisements", "vendors"
  add_foreign_key "answers", "questions"
  add_foreign_key "areas", "cities"
  add_foreign_key "enquiries", "users"
  add_foreign_key "item_choice_variants", "item_choices"
  add_foreign_key "item_choices", "menu_items"
  add_foreign_key "menu_items", "menu_item_categories"
  add_foreign_key "menu_items", "menu_item_cuisines"
  add_foreign_key "menu_items", "vendors"
  add_foreign_key "order_assignment_issues", "orders"
  add_foreign_key "order_assignments", "orders"
  add_foreign_key "order_assignments", "users"
  add_foreign_key "order_items", "menu_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "areas"
  add_foreign_key "orders", "profiles"
  add_foreign_key "orders", "vendors"
  add_foreign_key "profiles", "addresses"
  add_foreign_key "profiles", "restaurants"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "vendors"
  add_foreign_key "social_media", "restaurants"
  add_foreign_key "vendor_categories", "menu_item_categories"
  add_foreign_key "vendor_categories", "vendors"
  add_foreign_key "vendor_cuisines", "menu_item_cuisines"
  add_foreign_key "vendor_cuisines", "vendors"
  add_foreign_key "vendor_delivery_areas", "areas"
  add_foreign_key "vendor_delivery_areas", "vendors"
  add_foreign_key "vendors", "addresses"
  add_foreign_key "vendors", "menu_item_categories", column: "categories_id"
  add_foreign_key "vendors", "menu_item_cuisines", column: "cuisines_id"
  add_foreign_key "vendors", "restaurants"
end
