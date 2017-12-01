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

ActiveRecord::Schema.define(version: 20171201030933) do

  create_table "addresses", force: :cascade do |t|
    t.integer "address_type", default: 0
    t.string "building"
    t.string "number"
    t.string "street"
    t.string "floor"
    t.integer "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.index ["area_id"], name: "index_addresses_on_area_id"
    t.index ["profile_id"], name: "index_addresses_on_profile_id"
  end

  create_table "answers", force: :cascade do |t|
    t.integer "question_id"
    t.string "text"
    t.integer "sort_order"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.integer "city_id"
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

  create_table "enquiries", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "email"
    t.string "mobile_number"
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_enquiries_on_user_id"
  end

  create_table "item_choice_variants", force: :cascade do |t|
    t.integer "item_choice_id"
    t.string "name"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_choice_id"], name: "index_item_choice_variants_on_item_choice_id"
  end

  create_table "item_choices", force: :cascade do |t|
    t.integer "menu_item_id"
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

  create_table "menu_item_cuisines", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.integer "sort_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "ingredients"
    t.float "price"
    t.integer "menu_item_category_id"
    t.integer "menu_item_cuisine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vendor_id"
    t.index ["menu_item_category_id"], name: "index_menu_items_on_menu_item_category_id"
    t.index ["menu_item_cuisine_id"], name: "index_menu_items_on_menu_item_cuisine_id"
    t.index ["vendor_id"], name: "index_menu_items_on_vendor_id"
  end

  create_table "order_assignments", force: :cascade do |t|
    t.integer "assignee_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignee_id"], name: "index_order_assignments_on_assignee_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "quantity"
    t.integer "menu_item_id"
    t.integer "item_choice_variants"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_order_items_on_menu_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "profile_id"
    t.integer "area_id"
    t.integer "vendor_id"
    t.integer "status", default: 0
    t.string "mobile_number"
    t.integer "delivery_type", default: 0
    t.integer "finishing_time"
    t.float "delivery_charges"
    t.float "service_fee"
    t.string "order_source"
    t.datetime "replied_at"
    t.integer "progress_status", default: 0
    t.string "delivery_address"
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_orders_on_area_id"
    t.index ["profile_id"], name: "index_orders_on_profile_id"
    t.index ["vendor_id"], name: "index_orders_on_vendor_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_number"
    t.boolean "mobile_number_verified", default: false
    t.string "mobile_verification_code"
    t.integer "address_id"
    t.integer "status", default: 0
    t.integer "loyalty_points", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_profiles_on_address_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.integer "sort_order"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "working_hours_id"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.time "opening_hours"
    t.time "closing_hours"
    t.integer "weekdays"
    t.index ["working_hours_id"], name: "index_restaurants_on_working_hours_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "vendor_id"
    t.integer "user_id"
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
    t.integer "restaurant_id"
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
    t.string "name"
    t.string "nickname"
    t.string "image"
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
    t.integer "menu_item_category_id"
    t.integer "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_category_id"], name: "index_vendor_categories_on_menu_item_category_id"
    t.index ["vendor_id"], name: "index_vendor_categories_on_vendor_id"
  end

  create_table "vendor_cuisines", force: :cascade do |t|
    t.integer "menu_item_cuisine_id"
    t.integer "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_cuisine_id"], name: "index_vendor_cuisines_on_menu_item_cuisine_id"
    t.index ["vendor_id"], name: "index_vendor_cuisines_on_vendor_id"
  end

  create_table "vendor_delivery_areas", force: :cascade do |t|
    t.integer "area_id"
    t.integer "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_vendor_delivery_areas_on_area_id"
    t.index ["vendor_id"], name: "index_vendor_delivery_areas_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.integer "address_id"
    t.integer "restaurant_id"
    t.boolean "preorder"
    t.boolean "pickup"
    t.float "delivery_fee"
    t.integer "delivery_time"
    t.integer "status"
    t.integer "cuisine_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_vendors_on_address_id"
    t.index ["category_id"], name: "index_vendors_on_category_id"
    t.index ["cuisine_id"], name: "index_vendors_on_cuisine_id"
    t.index ["restaurant_id"], name: "index_vendors_on_restaurant_id"
  end

end
