# encoding: UTF-8
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
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "address_types", force: :cascade do |t|
    t.string   "name",       limit: 40, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "address_types", ["deleted_at"], name: "index_address_types_on_deleted_at", using: :btree
  add_index "address_types", ["name"], name: "index_address_types_on_name", where: "(deleted_at IS NULL)", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "full_name",       limit: 64,                null: false
    t.string   "address1",                                  null: false
    t.string   "address2"
    t.string   "landmark"
    t.string   "city"
    t.string   "zipcode",                                   null: false
    t.integer  "state_id"
    t.integer  "country_id"
    t.integer  "address_type_id"
    t.string   "phone"
    t.string   "alt_phone"
    t.integer  "vendor_id"
    t.boolean  "is_active",                  default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "addresses", ["address_type_id"], name: "index_addresses_on_address_type_id", using: :btree
  add_index "addresses", ["country_id"], name: "index_addresses_on_country_id", using: :btree
  add_index "addresses", ["deleted_at"], name: "index_addresses_on_deleted_at", using: :btree
  add_index "addresses", ["state_id"], name: "index_addresses_on_state_id", using: :btree
  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree
  add_index "addresses", ["vendor_id"], name: "index_addresses_on_vendor_id", using: :btree

  create_table "bank_accounts", force: :cascade do |t|
    t.string   "name",                       null: false
    t.string   "bank_name",                  null: false
    t.string   "branch_name"
    t.string   "ifsc_code"
    t.string   "account_no",                 null: false
    t.integer  "vendor_id"
    t.boolean  "is_active",   default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "bank_accounts", ["deleted_at"], name: "index_bank_accounts_on_deleted_at", using: :btree
  add_index "bank_accounts", ["vendor_id"], name: "index_bank_accounts_on_vendor_id", using: :btree

  create_table "banner_countries", force: :cascade do |t|
    t.integer  "banner_id"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "banner_countries", ["banner_id"], name: "index_banner_countries_on_banner_id", using: :btree
  add_index "banner_countries", ["country_id"], name: "index_banner_countries_on_country_id", using: :btree

  create_table "banner_device_types", force: :cascade do |t|
    t.integer  "banner_id"
    t.integer  "device_type_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "banner_device_types", ["banner_id"], name: "index_banner_device_types_on_banner_id", using: :btree
  add_index "banner_device_types", ["device_type_id"], name: "index_banner_device_types_on_device_type_id", using: :btree

  create_table "banners", force: :cascade do |t|
    t.string   "name",               limit: 50,                 null: false
    t.text     "description"
    t.datetime "start_date",                                    null: false
    t.datetime "end_date",                                      null: false
    t.string   "target_url"
    t.boolean  "in_new_tab"
    t.integer  "position"
    t.boolean  "is_active",                     default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "banners", ["deleted_at"], name: "index_banners_on_deleted_at", using: :btree
  add_index "banners", ["end_date"], name: "index_banners_on_end_date", where: "(deleted_at IS NULL)", using: :btree
  add_index "banners", ["name"], name: "index_banners_on_name", where: "(deleted_at IS NULL)", using: :btree
  add_index "banners", ["start_date"], name: "index_banners_on_start_date", where: "(deleted_at IS NULL)", using: :btree

  create_table "brownie_point_transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "order_id"
    t.float    "points",              default: 0.0, null: false
    t.integer  "event_id"
    t.integer  "transaction_type_id"
    t.text     "comment"
    t.datetime "deleted_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "brownie_point_transactions", ["deleted_at"], name: "index_brownie_point_transactions_on_deleted_at", using: :btree
  add_index "brownie_point_transactions", ["event_id"], name: "index_brownie_point_transactions_on_event_id", using: :btree
  add_index "brownie_point_transactions", ["order_id"], name: "index_brownie_point_transactions_on_order_id", using: :btree
  add_index "brownie_point_transactions", ["transaction_type_id"], name: "index_brownie_point_transactions_on_transaction_type_id", using: :btree
  add_index "brownie_point_transactions", ["user_id"], name: "index_brownie_point_transactions_on_user_id", using: :btree

  create_table "cart_items", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.integer  "quantity",        default: 0, null: false
    t.integer  "size_id"
    t.text     "note"
    t.integer  "vendor_order_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
  add_index "cart_items", ["deleted_at"], name: "index_cart_items_on_deleted_at", using: :btree
  add_index "cart_items", ["product_id"], name: "index_cart_items_on_product_id", using: :btree
  add_index "cart_items", ["size_id"], name: "index_cart_items_on_size_id", using: :btree
  add_index "cart_items", ["vendor_order_id"], name: "index_cart_items_on_vendor_order_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "email"
    t.integer  "coupon_id"
    t.boolean  "use_brownie_point", default: true
    t.boolean  "is_active",         default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "carts", ["coupon_id"], name: "index_carts_on_coupon_id", using: :btree
  add_index "carts", ["deleted_at"], name: "index_carts_on_deleted_at", using: :btree
  add_index "carts", ["email"], name: "index_carts_on_email", where: "(deleted_at IS NULL)", using: :btree
  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 50,                null: false
    t.text     "description"
    t.string   "slug"
    t.boolean  "is_active",              default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "categories", ["deleted_at"], name: "index_categories_on_deleted_at", using: :btree
  add_index "categories", ["name"], name: "index_categories_on_name", where: "(deleted_at IS NULL)", using: :btree
  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, where: "(deleted_at IS NULL)", using: :btree

  create_table "color_sub_categories", force: :cascade do |t|
    t.integer  "color_id"
    t.integer  "sub_category_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "color_sub_categories", ["color_id"], name: "index_color_sub_categories_on_color_id", using: :btree
  add_index "color_sub_categories", ["sub_category_id"], name: "index_color_sub_categories_on_sub_category_id", using: :btree

  create_table "colors", force: :cascade do |t|
    t.string   "name",       limit: 40,                null: false
    t.string   "code",                                 null: false
    t.string   "slug"
    t.boolean  "is_active",             default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "colors", ["deleted_at"], name: "index_colors_on_deleted_at", using: :btree
  add_index "colors", ["slug"], name: "index_colors_on_slug", unique: true, where: "(deleted_at IS NULL)", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 40,                null: false
    t.string   "iso_code"
    t.string   "iso_name"
    t.boolean  "is_active",             default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "countries", ["deleted_at"], name: "index_countries_on_deleted_at", using: :btree
  add_index "countries", ["iso_code"], name: "index_countries_on_iso_code", where: "(deleted_at IS NULL)", using: :btree
  add_index "countries", ["name"], name: "index_countries_on_name", where: "(deleted_at IS NULL)", using: :btree

  create_table "coupon_types", force: :cascade do |t|
    t.string   "name",       limit: 40,                null: false
    t.boolean  "is_active",             default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "coupon_types", ["deleted_at"], name: "index_coupon_types_on_deleted_at", using: :btree

  create_table "coupons", force: :cascade do |t|
    t.string   "name",                         limit: 40,                 null: false
    t.integer  "limit",                                   default: 0
    t.datetime "start_date",                                              null: false
    t.datetime "end_date",                                                null: false
    t.string   "code",                         limit: 40,                 null: false
    t.integer  "coupon_type_id"
    t.float    "percent_off",                             default: 0.0
    t.float    "flat_off",                                default: 0.0
    t.float    "minimum_amount",                          default: 0.0
    t.integer  "discount_type_id"
    t.integer  "use_count",                               default: 0
    t.integer  "maximum_discount",                        default: 0
    t.boolean  "is_cashback",                             default: false
    t.boolean  "app_only",                                default: false
    t.boolean  "only_for_new_user",                       default: false
    t.boolean  "discount_with_cashback_offer",            default: false
    t.boolean  "products_specific",                       default: false
    t.text     "product_ids"
    t.boolean  "is_active",                               default: true,  null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "coupons", ["code"], name: "index_coupons_on_code", where: "(deleted_at IS NULL)", using: :btree
  add_index "coupons", ["coupon_type_id"], name: "index_coupons_on_coupon_type_id", using: :btree
  add_index "coupons", ["deleted_at"], name: "index_coupons_on_deleted_at", using: :btree
  add_index "coupons", ["discount_type_id"], name: "index_coupons_on_discount_type_id", using: :btree
  add_index "coupons", ["name"], name: "index_coupons_on_name", where: "(deleted_at IS NULL)", using: :btree

  create_table "currency_rates", force: :cascade do |t|
    t.integer  "country_id"
    t.decimal  "rate",        precision: 8, scale: 2
    t.decimal  "market_rate", precision: 8, scale: 2
    t.boolean  "is_active",                           default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "currency_rates", ["country_id"], name: "index_currency_rates_on_country_id", using: :btree
  add_index "currency_rates", ["deleted_at"], name: "index_currency_rates_on_deleted_at", using: :btree

  create_table "device_types", force: :cascade do |t|
    t.string   "name",       limit: 40,                 null: false
    t.boolean  "is_active",             default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "device_types", ["deleted_at"], name: "index_device_types_on_deleted_at", using: :btree
  add_index "device_types", ["name"], name: "index_device_types_on_name", where: "(deleted_at IS NULL)", using: :btree

  create_table "discount_types", force: :cascade do |t|
    t.string   "name",                      null: false
    t.boolean  "is_active",  default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "discount_types", ["deleted_at"], name: "index_discount_types_on_deleted_at", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",       limit: 40,                 null: false
    t.string   "slug"
    t.boolean  "is_active",             default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "events", ["deleted_at"], name: "index_events_on_deleted_at", using: :btree
  add_index "events", ["slug"], name: "index_events_on_slug", unique: true, where: "(deleted_at IS NULL)", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.integer  "position"
    t.boolean  "is_active",           default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "images", ["deleted_at"], name: "index_images_on_deleted_at", using: :btree
  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree

  create_table "menu_managers", force: :cascade do |t|
    t.string   "name",             limit: 50,                 null: false
    t.string   "display_name"
    t.string   "slug"
    t.string   "url"
    t.boolean  "open_in_new_tab"
    t.integer  "position"
    t.integer  "menu_type_id"
    t.string   "icon_class"
    t.boolean  "sign_in_required",            default: false, null: false
    t.boolean  "is_active",                   default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "menu_managers", ["deleted_at"], name: "index_menu_managers_on_deleted_at", using: :btree
  add_index "menu_managers", ["menu_type_id"], name: "index_menu_managers_on_menu_type_id", using: :btree
  add_index "menu_managers", ["name"], name: "index_menu_managers_on_name", where: "(deleted_at IS NULL)", using: :btree
  add_index "menu_managers", ["slug"], name: "index_menu_managers_on_slug", unique: true, where: "(deleted_at IS NULL)", using: :btree

  create_table "menu_types", force: :cascade do |t|
    t.string   "name",       limit: 50,                 null: false
    t.string   "slug"
    t.boolean  "is_active",             default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "menu_types", ["deleted_at"], name: "index_menu_types_on_deleted_at", using: :btree
  add_index "menu_types", ["name"], name: "index_menu_types_on_name", where: "(deleted_at IS NULL)", using: :btree
  add_index "menu_types", ["slug"], name: "index_menu_types_on_slug", unique: true, where: "(deleted_at IS NULL)", using: :btree

  create_table "order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity",                                default: 1
    t.decimal  "rate",            precision: 8, scale: 2,               null: false
    t.decimal  "net_amount",      precision: 8, scale: 2,               null: false
    t.decimal  "discount_amount", precision: 8, scale: 2, default: 0.0
    t.decimal  "brownie_point",   precision: 8, scale: 2, default: 0.0
    t.decimal  "cashback",        precision: 8, scale: 2, default: 0.0
    t.datetime "delivery_date"
    t.datetime "deleted_at"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  add_index "order_items", ["deleted_at"], name: "index_order_items_on_deleted_at", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "total",               precision: 8, scale: 2,               null: false
    t.decimal  "grand_total",         precision: 8, scale: 2,               null: false
    t.decimal  "shipping",            precision: 8, scale: 2, default: 0.0
    t.date     "date",                                                      null: false
    t.integer  "status"
    t.string   "number"
    t.integer  "payment_status_id"
    t.float    "cod_charge",                                  default: 0.0
    t.integer  "cart_id"
    t.decimal  "currency_rate",       precision: 8, scale: 2
    t.integer  "payment_method_id"
    t.text     "notes"
    t.decimal  "discount",            precision: 8, scale: 2, default: 0.0
    t.decimal  "cashback",            precision: 8, scale: 2, default: 0.0
    t.decimal  "brownie_point",       precision: 8, scale: 2, default: 0.0
    t.decimal  "market_rate",         precision: 8, scale: 2
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.datetime "deleted_at"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  add_index "orders", ["cart_id"], name: "index_orders_on_cart_id", using: :btree
  add_index "orders", ["deleted_at"], name: "index_orders_on_deleted_at", using: :btree
  add_index "orders", ["number"], name: "index_orders_on_number", where: "(deleted_at IS NULL)", using: :btree
  add_index "orders", ["payment_method_id"], name: "index_orders_on_payment_method_id", using: :btree
  add_index "orders", ["payment_status_id"], name: "index_orders_on_payment_status_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payment_methods", force: :cascade do |t|
    t.string   "name",         limit: 40,                 null: false
    t.string   "payment_mode"
    t.boolean  "is_active",               default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "payment_methods", ["deleted_at"], name: "index_payment_methods_on_deleted_at", using: :btree
  add_index "payment_methods", ["name"], name: "index_payment_methods_on_name", where: "(deleted_at IS NULL)", using: :btree

  create_table "payment_statuses", force: :cascade do |t|
    t.string   "name",       limit: 40,                null: false
    t.boolean  "is_active",             default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "payment_statuses", ["deleted_at"], name: "index_payment_statuses_on_deleted_at", using: :btree

  create_table "price_ranges", force: :cascade do |t|
    t.float    "min_price",       default: 0.0,   null: false
    t.float    "max_price",       default: 0.0,   null: false
    t.integer  "sub_category_id"
    t.boolean  "is_active",       default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "price_ranges", ["deleted_at"], name: "index_price_ranges_on_deleted_at", using: :btree
  add_index "price_ranges", ["sub_category_id"], name: "index_price_ranges_on_sub_category_id", using: :btree

  create_table "product_attributes", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "sub_category_attribute_id"
    t.string   "name",                      limit: 50,                 null: false
    t.string   "description"
    t.integer  "position"
    t.boolean  "is_active",                            default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "product_attributes", ["deleted_at"], name: "index_product_attributes_on_deleted_at", using: :btree
  add_index "product_attributes", ["product_id"], name: "index_product_attributes_on_product_id", using: :btree
  add_index "product_attributes", ["sub_category_attribute_id"], name: "index_product_attributes_on_sub_category_attribute_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",              limit: 100,                                         null: false
    t.string   "dimension"
    t.text     "description"
    t.decimal  "sell_price",                    precision: 8, scale: 2,                 null: false
    t.decimal  "purchase_price",                precision: 8, scale: 2
    t.integer  "vendor_id"
    t.integer  "sub_category_id"
    t.integer  "color_id"
    t.integer  "quantity",                                                              null: false
    t.integer  "domestic_pos",                                                          null: false
    t.integer  "international_pos",                                                     null: false
    t.text     "specification"
    t.string   "product_code",                                                          null: false
    t.float    "weight"
    t.integer  "sell_count",                                            default: 0,     null: false
    t.text     "notes"
    t.integer  "clicks",                                                default: 0,     null: false
    t.integer  "discount_percent",                                      default: 0,     null: false
    t.decimal  "discount_amount",               precision: 8, scale: 2, default: 0.0,   null: false
    t.boolean  "in_stock",                                              default: false, null: false
    t.string   "slug"
    t.boolean  "is_active",                                             default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
  end

  add_index "products", ["color_id"], name: "index_products_on_color_id", using: :btree
  add_index "products", ["deleted_at"], name: "index_products_on_deleted_at", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", where: "(deleted_at IS NULL)", using: :btree
  add_index "products", ["sell_price"], name: "index_products_on_sell_price", where: "(deleted_at IS NULL)", using: :btree
  add_index "products", ["slug"], name: "index_products_on_slug", unique: true, where: "(deleted_at IS NULL)", using: :btree
  add_index "products", ["sub_category_id"], name: "index_products_on_sub_category_id", using: :btree
  add_index "products", ["vendor_id"], name: "index_products_on_vendor_id", using: :btree

  create_table "products_sizes", id: false, force: :cascade do |t|
    t.integer "product_id"
    t.integer "size_id"
  end

  add_index "products_sizes", ["product_id"], name: "index_products_sizes_on_product_id", using: :btree
  add_index "products_sizes", ["size_id"], name: "index_products_sizes_on_size_id", using: :btree

  create_table "referreds", force: :cascade do |t|
    t.string   "name",        limit: 64,                null: false
    t.string   "email",       limit: 40
    t.string   "phone_no",    limit: 20,                null: false
    t.integer  "referrer_id"
    t.boolean  "is_active",              default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "referreds", ["deleted_at"], name: "index_referreds_on_deleted_at", using: :btree
  add_index "referreds", ["email"], name: "index_referreds_on_email", where: "(deleted_at IS NULL)", using: :btree
  add_index "referreds", ["name"], name: "index_referreds_on_name", where: "(deleted_at IS NULL)", using: :btree
  add_index "referreds", ["referrer_id"], name: "index_referreds_on_referrer_id", using: :btree

  create_table "referrers", force: :cascade do |t|
    t.string   "name",       limit: 64,                null: false
    t.string   "email",      limit: 40
    t.string   "phone_no",   limit: 20,                null: false
    t.boolean  "is_active",             default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "referrers", ["deleted_at"], name: "index_referrers_on_deleted_at", using: :btree
  add_index "referrers", ["email"], name: "index_referrers_on_email", where: "(deleted_at IS NULL)", using: :btree
  add_index "referrers", ["name"], name: "index_referrers_on_name", where: "(deleted_at IS NULL)", using: :btree

  create_table "sizes", force: :cascade do |t|
    t.string   "name",        limit: 40, null: false
    t.integer  "category_id"
    t.datetime "deleted_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sizes", ["category_id"], name: "index_sizes_on_category_id", using: :btree
  add_index "sizes", ["deleted_at"], name: "index_sizes_on_deleted_at", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 40,                null: false
    t.string   "abbr"
    t.integer  "country_id"
    t.boolean  "is_active",             default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree
  add_index "states", ["deleted_at"], name: "index_states_on_deleted_at", using: :btree

  create_table "sub_categories", force: :cascade do |t|
    t.string   "name",               limit: 50,                null: false
    t.text     "description"
    t.integer  "category_id"
    t.string   "slug"
    t.boolean  "is_active",                     default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id", using: :btree
  add_index "sub_categories", ["deleted_at"], name: "index_sub_categories_on_deleted_at", using: :btree
  add_index "sub_categories", ["name"], name: "index_sub_categories_on_name", where: "(deleted_at IS NULL)", using: :btree
  add_index "sub_categories", ["slug"], name: "index_sub_categories_on_slug", unique: true, where: "(deleted_at IS NULL)", using: :btree

  create_table "sub_category_attributes", force: :cascade do |t|
    t.integer  "sub_category_id"
    t.string   "attribute_type"
    t.string   "name",            limit: 50,                 null: false
    t.text     "content"
    t.integer  "position"
    t.boolean  "is_active",                  default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "sub_category_attributes", ["attribute_type"], name: "index_sub_category_attributes_on_attribute_type", where: "(deleted_at IS NULL)", using: :btree
  add_index "sub_category_attributes", ["deleted_at"], name: "index_sub_category_attributes_on_deleted_at", using: :btree
  add_index "sub_category_attributes", ["sub_category_id"], name: "index_sub_category_attributes_on_sub_category_id", using: :btree

  create_table "system_constants", force: :cascade do |t|
    t.string   "name",        limit: 40,                null: false
    t.string   "value"
    t.text     "description"
    t.boolean  "is_active",              default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "system_constants", ["deleted_at"], name: "index_system_constants_on_deleted_at", using: :btree
  add_index "system_constants", ["name"], name: "index_system_constants_on_name", where: "(deleted_at IS NULL)", using: :btree

  create_table "transaction_types", force: :cascade do |t|
    t.string   "name",       limit: 40,                null: false
    t.string   "slug"
    t.boolean  "is_active",             default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "transaction_types", ["deleted_at"], name: "index_transaction_types_on_deleted_at", using: :btree
  add_index "transaction_types", ["slug"], name: "index_transaction_types_on_slug", unique: true, where: "(deleted_at IS NULL)", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",               limit: 64,                null: false
    t.string   "phone_number",           limit: 20,                null: false
    t.float    "brownie_point",                     default: 0.0,  null: false
    t.boolean  "is_active",                         default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "email",                             default: "",   null: false
    t.string   "encrypted_password",                default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vendor_orders", force: :cascade do |t|
    t.integer  "vendor_id"
    t.integer  "user_id"
    t.string   "state"
    t.string   "payment_state"
    t.float    "total"
    t.integer  "coupon_id"
    t.text     "notes"
    t.datetime "confirmed_at"
    t.float    "discount"
    t.float    "shipping"
    t.float    "market_rate"
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.integer  "cart_id"
    t.string   "number"
    t.boolean  "is_active"
    t.datetime "deleted_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "vendor_orders", ["cart_id"], name: "index_vendor_orders_on_cart_id", using: :btree
  add_index "vendor_orders", ["coupon_id"], name: "index_vendor_orders_on_coupon_id", using: :btree
  add_index "vendor_orders", ["number"], name: "index_vendor_orders_on_number", using: :btree
  add_index "vendor_orders", ["payment_state"], name: "index_vendor_orders_on_payment_state", using: :btree
  add_index "vendor_orders", ["state"], name: "index_vendor_orders_on_state", using: :btree
  add_index "vendor_orders", ["user_id"], name: "index_vendor_orders_on_user_id", using: :btree
  add_index "vendor_orders", ["vendor_id"], name: "index_vendor_orders_on_vendor_id", using: :btree

  create_table "vendors", force: :cascade do |t|
    t.string   "name",            limit: 50,                                         null: false
    t.string   "email",                                                              null: false
    t.text     "description"
    t.text     "policy"
    t.boolean  "is_whole_seller"
    t.decimal  "rate",                       precision: 8, scale: 2
    t.boolean  "is_active",                                          default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
  end

  add_index "vendors", ["deleted_at"], name: "index_vendors_on_deleted_at", using: :btree
  add_index "vendors", ["email"], name: "index_vendors_on_email", where: "(deleted_at IS NULL)", using: :btree
  add_index "vendors", ["name"], name: "index_vendors_on_name", where: "(deleted_at IS NULL)", using: :btree

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
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "payment_methods"
  add_foreign_key "orders", "payment_statuses"
  add_foreign_key "orders", "users"
  add_foreign_key "price_ranges", "sub_categories"
  add_foreign_key "product_attributes", "products"
  add_foreign_key "product_attributes", "sub_category_attributes"
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
