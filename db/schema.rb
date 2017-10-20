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

ActiveRecord::Schema.define(version: 20170917075943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "address_types", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_address_types_on_deleted_at"
    t.index ["name"], name: "index_address_types_on_name", where: "(deleted_at IS NULL)"
  end

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "full_name", limit: 64, null: false
    t.string "address1", null: false
    t.string "address2"
    t.string "landmark"
    t.string "city"
    t.string "zipcode", null: false
    t.bigint "state_id"
    t.bigint "country_id"
    t.bigint "address_type_id"
    t.string "phone"
    t.string "alt_phone"
    t.bigint "vendor_id"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_type_id"], name: "index_addresses_on_address_type_id"
    t.index ["country_id"], name: "index_addresses_on_country_id"
    t.index ["deleted_at"], name: "index_addresses_on_deleted_at"
    t.index ["state_id"], name: "index_addresses_on_state_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
    t.index ["vendor_id"], name: "index_addresses_on_vendor_id"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "bank_name", null: false
    t.string "branch_name"
    t.string "ifsc_code"
    t.string "account_no", null: false
    t.bigint "vendor_id"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_bank_accounts_on_deleted_at"
    t.index ["vendor_id"], name: "index_bank_accounts_on_vendor_id"
  end

  create_table "banner_countries", force: :cascade do |t|
    t.bigint "banner_id"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["banner_id"], name: "index_banner_countries_on_banner_id"
    t.index ["country_id"], name: "index_banner_countries_on_country_id"
  end

  create_table "banner_device_types", force: :cascade do |t|
    t.bigint "banner_id"
    t.bigint "device_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["banner_id"], name: "index_banner_device_types_on_banner_id"
    t.index ["device_type_id"], name: "index_banner_device_types_on_device_type_id"
  end

  create_table "banners", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.text "description"
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.string "target_url"
    t.boolean "in_new_tab"
    t.integer "position"
    t.boolean "is_active", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["deleted_at"], name: "index_banners_on_deleted_at"
    t.index ["end_date"], name: "index_banners_on_end_date", where: "(deleted_at IS NULL)"
    t.index ["name"], name: "index_banners_on_name", where: "(deleted_at IS NULL)"
    t.index ["start_date"], name: "index_banners_on_start_date", where: "(deleted_at IS NULL)"
  end

  create_table "brownie_point_transactions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "order_id"
    t.float "points", default: 0.0, null: false
    t.bigint "event_id"
    t.bigint "transaction_type_id"
    t.text "comment"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_brownie_point_transactions_on_deleted_at"
    t.index ["event_id"], name: "index_brownie_point_transactions_on_event_id"
    t.index ["order_id"], name: "index_brownie_point_transactions_on_order_id"
    t.index ["transaction_type_id"], name: "index_brownie_point_transactions_on_transaction_type_id"
    t.index ["user_id"], name: "index_brownie_point_transactions_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "product_id"
    t.integer "quantity", default: 0, null: false
    t.bigint "size_id"
    t.text "note"
    t.bigint "vendor_order_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["deleted_at"], name: "index_cart_items_on_deleted_at"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
    t.index ["size_id"], name: "index_cart_items_on_size_id"
    t.index ["vendor_order_id"], name: "index_cart_items_on_vendor_order_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "email"
    t.bigint "coupon_id"
    t.boolean "use_brownie_point", default: true
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_carts_on_coupon_id"
    t.index ["deleted_at"], name: "index_carts_on_deleted_at"
    t.index ["email"], name: "index_carts_on_email", where: "(deleted_at IS NULL)"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.text "description"
    t.string "slug"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_categories_on_deleted_at"
    t.index ["name"], name: "index_categories_on_name", where: "(deleted_at IS NULL)"
    t.index ["slug"], name: "index_categories_on_slug", unique: true, where: "(deleted_at IS NULL)"
  end

  create_table "color_sub_categories", force: :cascade do |t|
    t.bigint "color_id"
    t.bigint "sub_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_color_sub_categories_on_color_id"
    t.index ["sub_category_id"], name: "index_color_sub_categories_on_sub_category_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "code", null: false
    t.string "slug"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_colors_on_deleted_at"
    t.index ["slug"], name: "index_colors_on_slug", unique: true, where: "(deleted_at IS NULL)"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "iso_code"
    t.string "iso_name"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_countries_on_deleted_at"
    t.index ["iso_code"], name: "index_countries_on_iso_code", where: "(deleted_at IS NULL)"
    t.index ["name"], name: "index_countries_on_name", where: "(deleted_at IS NULL)"
  end

  create_table "coupon_types", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_coupon_types_on_deleted_at"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.integer "limit", default: 0
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.string "code", limit: 40, null: false
    t.bigint "coupon_type_id"
    t.float "percent_off", default: 0.0
    t.float "flat_off", default: 0.0
    t.float "minimum_amount", default: 0.0
    t.bigint "discount_type_id"
    t.integer "use_count", default: 0
    t.integer "maximum_discount", default: 0
    t.boolean "is_cashback", default: false
    t.boolean "app_only", default: false
    t.boolean "only_for_new_user", default: false
    t.boolean "discount_with_cashback_offer", default: false
    t.boolean "products_specific", default: false
    t.text "product_ids"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_coupons_on_code", where: "(deleted_at IS NULL)"
    t.index ["coupon_type_id"], name: "index_coupons_on_coupon_type_id"
    t.index ["deleted_at"], name: "index_coupons_on_deleted_at"
    t.index ["discount_type_id"], name: "index_coupons_on_discount_type_id"
    t.index ["name"], name: "index_coupons_on_name", where: "(deleted_at IS NULL)"
  end

  create_table "currency_rates", force: :cascade do |t|
    t.bigint "country_id"
    t.decimal "rate", precision: 8, scale: 4
    t.decimal "market_rate", precision: 8, scale: 4
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_currency_rates_on_country_id"
    t.index ["deleted_at"], name: "index_currency_rates_on_deleted_at"
  end

  create_table "device_types", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.boolean "is_active", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_device_types_on_deleted_at"
    t.index ["name"], name: "index_device_types_on_name", where: "(deleted_at IS NULL)"
  end

  create_table "discount_types", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_discount_types_on_deleted_at"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "slug"
    t.boolean "is_active", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_events_on_deleted_at"
    t.index ["slug"], name: "index_events_on_slug", unique: true, where: "(deleted_at IS NULL)"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "images", force: :cascade do |t|
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.integer "position"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["deleted_at"], name: "index_images_on_deleted_at"
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "menu_managers", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "display_name"
    t.string "slug"
    t.string "url"
    t.boolean "open_in_new_tab"
    t.integer "position"
    t.bigint "menu_type_id"
    t.string "icon_class"
    t.boolean "sign_in_required", default: false, null: false
    t.boolean "is_active", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_menu_managers_on_deleted_at"
    t.index ["menu_type_id"], name: "index_menu_managers_on_menu_type_id"
    t.index ["name"], name: "index_menu_managers_on_name", where: "(deleted_at IS NULL)"
    t.index ["slug"], name: "index_menu_managers_on_slug", unique: true, where: "(deleted_at IS NULL)"
  end

  create_table "menu_types", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "slug"
    t.boolean "is_active", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_menu_types_on_deleted_at"
    t.index ["name"], name: "index_menu_types_on_name", where: "(deleted_at IS NULL)"
    t.index ["slug"], name: "index_menu_types_on_slug", unique: true, where: "(deleted_at IS NULL)"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.bigint "cart_item_id"
    t.integer "quantity", default: 1
    t.integer "status"
    t.decimal "rate", precision: 8, scale: 2, null: false
    t.decimal "net_amount", precision: 8, scale: 2, null: false
    t.decimal "discount_amount", precision: 8, scale: 2, default: "0.0"
    t.decimal "brownie_point", precision: 8, scale: 2, default: "0.0"
    t.decimal "cashback", precision: 8, scale: 2, default: "0.0"
    t.datetime "delivery_date"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_item_id"], name: "index_order_items_on_cart_item_id"
    t.index ["deleted_at"], name: "index_order_items_on_deleted_at"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "total", precision: 8, scale: 2, null: false
    t.decimal "grand_total", precision: 8, scale: 2, null: false
    t.decimal "shipping", precision: 8, scale: 2, default: "0.0"
    t.date "date", null: false
    t.integer "status"
    t.string "number"
    t.bigint "payment_status_id"
    t.float "cod_charge", default: 0.0
    t.bigint "cart_id"
    t.decimal "currency_rate", precision: 8, scale: 2
    t.bigint "payment_method_id"
    t.text "notes"
    t.decimal "discount", precision: 8, scale: 2, default: "0.0"
    t.decimal "cashback", precision: 8, scale: 2, default: "0.0"
    t.decimal "brownie_point", precision: 8, scale: 2, default: "0.0"
    t.decimal "market_rate", precision: 8, scale: 2
    t.integer "billing_address_id"
    t.integer "shipping_address_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["deleted_at"], name: "index_orders_on_deleted_at"
    t.index ["number"], name: "index_orders_on_number", where: "(deleted_at IS NULL)"
    t.index ["payment_method_id"], name: "index_orders_on_payment_method_id"
    t.index ["payment_status_id"], name: "index_orders_on_payment_status_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "payment_mode"
    t.boolean "is_active", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_payment_methods_on_deleted_at"
    t.index ["name"], name: "index_payment_methods_on_name", where: "(deleted_at IS NULL)"
  end

  create_table "payment_statuses", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_payment_statuses_on_deleted_at"
  end

  create_table "price_ranges", force: :cascade do |t|
    t.float "min_price", default: 0.0, null: false
    t.float "max_price", default: 0.0, null: false
    t.bigint "sub_category_id"
    t.boolean "is_active", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_price_ranges_on_deleted_at"
    t.index ["sub_category_id"], name: "index_price_ranges_on_sub_category_id"
  end

  create_table "product_attributes", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "sub_category_attribute_id"
    t.string "name", limit: 50, null: false
    t.string "description"
    t.integer "position"
    t.boolean "is_active", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_product_attributes_on_deleted_at"
    t.index ["product_id"], name: "index_product_attributes_on_product_id"
    t.index ["sub_category_attribute_id"], name: "index_product_attributes_on_sub_category_attribute_id"
  end

  create_table "product_sizes", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "size_id"
    t.integer "quantity", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_sizes_on_product_id"
    t.index ["size_id"], name: "index_product_sizes_on_size_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "dimension"
    t.text "description"
    t.decimal "purchase_price", precision: 8, scale: 2
    t.decimal "original_price", precision: 8, scale: 2, null: false
    t.decimal "sell_price", precision: 8, scale: 2, null: false
    t.bigint "vendor_id"
    t.bigint "sub_category_id"
    t.bigint "color_id"
    t.integer "quantity", null: false
    t.integer "domestic_pos", null: false
    t.integer "international_pos", null: false
    t.text "specification"
    t.string "product_code", null: false
    t.float "weight"
    t.integer "sell_count", default: 0, null: false
    t.text "notes"
    t.integer "clicks", default: 0, null: false
    t.integer "discount_percent", default: 0, null: false
    t.boolean "in_stock", default: false, null: false
    t.string "slug"
    t.boolean "is_active", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_products_on_color_id"
    t.index ["deleted_at"], name: "index_products_on_deleted_at"
    t.index ["name"], name: "index_products_on_name", where: "(deleted_at IS NULL)"
    t.index ["sell_price"], name: "index_products_on_sell_price", where: "(deleted_at IS NULL)"
    t.index ["slug"], name: "index_products_on_slug", unique: true, where: "(deleted_at IS NULL)"
    t.index ["sub_category_id"], name: "index_products_on_sub_category_id"
    t.index ["vendor_id"], name: "index_products_on_vendor_id"
  end

  create_table "referreds", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.string "email", limit: 40
    t.string "phone_no", limit: 20, null: false
    t.bigint "referrer_id"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_referreds_on_deleted_at"
    t.index ["email"], name: "index_referreds_on_email", where: "(deleted_at IS NULL)"
    t.index ["name"], name: "index_referreds_on_name", where: "(deleted_at IS NULL)"
    t.index ["referrer_id"], name: "index_referreds_on_referrer_id"
  end

  create_table "referrers", force: :cascade do |t|
    t.string "name", limit: 64, null: false
    t.string "email", limit: 40
    t.string "phone_no", limit: 20, null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_referrers_on_deleted_at"
    t.index ["email"], name: "index_referrers_on_email", where: "(deleted_at IS NULL)"
    t.index ["name"], name: "index_referrers_on_name", where: "(deleted_at IS NULL)"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.bigint "category_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sizes_on_category_id"
    t.index ["deleted_at"], name: "index_sizes_on_deleted_at"
  end

  create_table "states", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "abbr"
    t.bigint "country_id"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
    t.index ["deleted_at"], name: "index_states_on_deleted_at"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.text "description"
    t.bigint "category_id"
    t.string "slug"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
    t.index ["deleted_at"], name: "index_sub_categories_on_deleted_at"
    t.index ["name"], name: "index_sub_categories_on_name", where: "(deleted_at IS NULL)"
    t.index ["slug"], name: "index_sub_categories_on_slug", unique: true, where: "(deleted_at IS NULL)"
  end

  create_table "sub_category_attributes", force: :cascade do |t|
    t.bigint "sub_category_id"
    t.string "attribute_type"
    t.string "name", limit: 50, null: false
    t.text "content"
    t.integer "position"
    t.boolean "is_active", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attribute_type"], name: "index_sub_category_attributes_on_attribute_type", where: "(deleted_at IS NULL)"
    t.index ["deleted_at"], name: "index_sub_category_attributes_on_deleted_at"
    t.index ["sub_category_id"], name: "index_sub_category_attributes_on_sub_category_id"
  end

  create_table "system_constants", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "value"
    t.text "description"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_system_constants_on_deleted_at"
    t.index ["name"], name: "index_system_constants_on_name", where: "(deleted_at IS NULL)"
  end

  create_table "transaction_types", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "slug"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_transaction_types_on_deleted_at"
    t.index ["slug"], name: "index_transaction_types_on_slug", unique: true, where: "(deleted_at IS NULL)"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 64, null: false
    t.string "phone_number", limit: 20, null: false
    t.float "brownie_point", default: 0.0, null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendor_orders", force: :cascade do |t|
    t.bigint "vendor_id"
    t.bigint "user_id"
    t.string "state"
    t.string "payment_state"
    t.float "total"
    t.bigint "coupon_id"
    t.text "notes"
    t.datetime "confirmed_at"
    t.float "discount"
    t.float "shipping"
    t.float "market_rate"
    t.integer "billing_address_id"
    t.integer "shipping_address_id"
    t.bigint "cart_id"
    t.string "number"
    t.boolean "is_active"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_vendor_orders_on_cart_id"
    t.index ["coupon_id"], name: "index_vendor_orders_on_coupon_id"
    t.index ["number"], name: "index_vendor_orders_on_number"
    t.index ["payment_state"], name: "index_vendor_orders_on_payment_state"
    t.index ["state"], name: "index_vendor_orders_on_state"
    t.index ["user_id"], name: "index_vendor_orders_on_user_id"
    t.index ["vendor_id"], name: "index_vendor_orders_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "email", null: false
    t.text "description"
    t.text "policy"
    t.boolean "is_whole_seller"
    t.decimal "rate", precision: 8, scale: 2
    t.boolean "is_active", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_vendors_on_deleted_at"
    t.index ["email"], name: "index_vendors_on_email", where: "(deleted_at IS NULL)"
    t.index ["name"], name: "index_vendors_on_name", where: "(deleted_at IS NULL)"
  end

  add_foreign_key "addresses", "address_types"
  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "states"
  add_foreign_key "addresses", "users"
  add_foreign_key "addresses", "vendors"
  add_foreign_key "bank_accounts", "vendors"
  add_foreign_key "banner_countries", "banners"
  add_foreign_key "banner_countries", "countries"
  add_foreign_key "banner_device_types", "banners"
  add_foreign_key "banner_device_types", "device_types"
  add_foreign_key "brownie_point_transactions", "events"
  add_foreign_key "brownie_point_transactions", "orders"
  add_foreign_key "brownie_point_transactions", "transaction_types"
  add_foreign_key "brownie_point_transactions", "users"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "cart_items", "sizes"
  add_foreign_key "cart_items", "vendor_orders"
  add_foreign_key "carts", "coupons"
  add_foreign_key "carts", "users"
  add_foreign_key "color_sub_categories", "colors"
  add_foreign_key "color_sub_categories", "sub_categories"
  add_foreign_key "coupons", "coupon_types"
  add_foreign_key "coupons", "discount_types"
  add_foreign_key "currency_rates", "countries"
  add_foreign_key "menu_managers", "menu_types"
  add_foreign_key "order_items", "cart_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "payment_methods"
  add_foreign_key "orders", "payment_statuses"
  add_foreign_key "orders", "users"
  add_foreign_key "price_ranges", "sub_categories"
  add_foreign_key "product_attributes", "products"
  add_foreign_key "product_attributes", "sub_category_attributes"
  add_foreign_key "product_sizes", "products"
  add_foreign_key "product_sizes", "sizes"
  add_foreign_key "products", "colors"
  add_foreign_key "products", "sub_categories"
  add_foreign_key "products", "vendors"
  add_foreign_key "referreds", "referrers"
  add_foreign_key "sizes", "categories"
  add_foreign_key "states", "countries"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "sub_category_attributes", "sub_categories"
  add_foreign_key "vendor_orders", "carts"
  add_foreign_key "vendor_orders", "coupons"
  add_foreign_key "vendor_orders", "users"
  add_foreign_key "vendor_orders", "vendors"
end
