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

ActiveRecord::Schema.define(version: 20140211030840) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "address_establishments", force: true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "establishment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "address_establishments", ["establishment_id"], name: "index_address_establishments_on_establishment_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "catches", force: true do |t|
    t.date     "dateinit"
    t.date     "dateend"
    t.integer  "offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "catches", ["offer_id"], name: "index_catches_on_offer_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_establishments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
  end

  create_table "commentestabs", force: true do |t|
    t.text     "comment"
    t.integer  "establishment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commentestabs", ["establishment_id"], name: "index_commentestabs_on_establishment_id"
  add_index "commentestabs", ["user_id"], name: "index_commentestabs_on_user_id"

  create_table "downloads", force: true do |t|
    t.integer  "offer_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  add_index "downloads", ["offer_id"], name: "index_downloads_on_offer_id"
  add_index "downloads", ["user_id"], name: "index_downloads_on_user_id"

  create_table "establishments", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "phone"
    t.string   "email"
    t.string   "password"
    t.string   "cnpj"
    t.string   "reason"
    t.integer  "city_id"
    t.integer  "plan_id"
    t.string   "imageprofile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "address_establishment_id"
    t.string   "site"
    t.text     "description"
    t.string   "facebook"
    t.string   "twitter"
    t.integer  "category_establishment_id"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "instagram_link"
  end

  add_index "establishments", ["category_establishment_id"], name: "index_establishments_on_category_establishment_id"
  add_index "establishments", ["category_id"], name: "index_establishments_on_category_id"
  add_index "establishments", ["city_id"], name: "index_establishments_on_city_id"
  add_index "establishments", ["plan_id"], name: "index_establishments_on_plan_id"

  create_table "image_establishments", force: true do |t|
    t.string   "image"
    t.integer  "establishment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "image_establishments", ["establishment_id"], name: "index_image_establishments_on_establishment_id"

  create_table "like_establishments", force: true do |t|
    t.integer  "count"
    t.integer  "establishment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "like_establishments", ["establishment_id"], name: "index_like_establishments_on_establishment_id"
  add_index "like_establishments", ["user_id"], name: "index_like_establishments_on_user_id"

  create_table "locationestablishments", force: true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "establishment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.text     "description"
    t.integer  "offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["offer_id"], name: "index_notes_on_offer_id"

  create_table "offers", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "establishment_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.date     "validity"
    t.date     "date"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "priceproduct",     precision: 8, scale: 2
  end

  add_index "offers", ["establishment_id"], name: "index_offers_on_establishment_id"
  add_index "offers", ["product_id"], name: "index_offers_on_product_id"

  create_table "partners", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "surname"
    t.string   "phone"
    t.string   "contact"
    t.string   "address"
    t.string   "cnpj"
    t.string   "reason"
    t.string   "cep"
    t.integer  "city_id"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "partners", ["email"], name: "index_partners_on_email", unique: true
  add_index "partners", ["reset_password_token"], name: "index_partners_on_reset_password_token", unique: true

  create_table "plans", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.integer  "establishment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "priceproduct",     precision: 8, scale: 2
  end

  add_index "products", ["establishment_id"], name: "index_products_on_establishment_id"

  create_table "rules", force: true do |t|
    t.text     "description"
    t.integer  "offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rules", ["offer_id"], name: "index_rules_on_offer_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.string   "namefull"
    t.string   "phone"
    t.string   "city"
    t.date     "nascimento"
    t.integer  "city_id"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "visited_offers", force: true do |t|
    t.integer  "user_id"
    t.integer  "offer_id"
    t.integer  "category_establishments_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
