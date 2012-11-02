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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121102132335) do

  create_table "categories", :force => true do |t|
    t.integer  "parent"
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "consumes", :force => true do |t|
    t.date     "date",              :null => false
    t.string   "puprpose"
    t.integer  "thing_instance_id", :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "consumes", ["thing_instance_id"], :name => "index_consumes_on_thing_instance_id"

  create_table "limits", :force => true do |t|
    t.float    "critical"
    t.float    "ends"
    t.float    "full"
    t.integer  "user_id"
    t.integer  "thing_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "limits", ["thing_id"], :name => "index_limits_on_thing_id"
  add_index "limits", ["user_id"], :name => "index_limits_on_user_id"

  create_table "manufacturers", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "purchases", :force => true do |t|
    t.decimal  "price"
    t.date     "date",            :null => false
    t.integer  "shop_id"
    t.integer  "manufacturer_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "purchases", ["manufacturer_id"], :name => "index_purchases_on_manufacturer_id"
  add_index "purchases", ["shop_id"], :name => "index_purchases_on_shop_id"

  create_table "shops", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "storages", :force => true do |t|
    t.string   "name",        :null => false
    t.integer  "parent"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "thing_instances", :force => true do |t|
    t.date     "valid_until"
    t.integer  "user_id",     :null => false
    t.integer  "storage_id",  :null => false
    t.integer  "purchase_id", :null => false
    t.integer  "thing_id",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "thing_instances", ["purchase_id"], :name => "index_thing_instances_on_purchase_id"
  add_index "thing_instances", ["storage_id"], :name => "index_thing_instances_on_storage_id"
  add_index "thing_instances", ["thing_id"], :name => "index_thing_instances_on_thing_id"
  add_index "thing_instances", ["user_id"], :name => "index_thing_instances_on_user_id"

  create_table "things", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "unit",        :null => false
    t.string   "descripion"
    t.integer  "category_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
