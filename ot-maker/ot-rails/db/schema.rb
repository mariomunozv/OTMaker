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

ActiveRecord::Schema.define(version: 20150114172248) do

  create_table "bill_orders", force: true do |t|
    t.integer  "folio"
    t.date     "issued"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "changes", force: true do |t|
    t.integer  "work_order_id"
    t.integer  "user_id"
    t.integer  "user_assigned_id"
    t.string   "code"
    t.string   "title"
    t.string   "description"
    t.integer  "bill_order_id"
    t.integer  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "changes", ["bill_order_id"], name: "index_changes_on_bill_order_id", using: :btree
  add_index "changes", ["user_id"], name: "index_changes_on_user_id", using: :btree
  add_index "changes", ["work_order_id"], name: "index_changes_on_work_order_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "work_order_id"
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree
  add_index "comments", ["work_order_id"], name: "index_comments_on_work_order_id", using: :btree

  create_table "notification_types", force: true do |t|
    t.string   "name"
    t.string   "template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.integer  "work_order_id"
    t.string   "detail"
    t.string   "status"
    t.integer  "notification_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["notification_type_id"], name: "index_notifications_on_notification_type_id", using: :btree
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree
  add_index "notifications", ["work_order_id"], name: "index_notifications_on_work_order_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "phone"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "organizations", ["user_id"], name: "index_organizations_on_user_id", using: :btree

  create_table "participations", force: true do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.string   "role"
    t.integer  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participations", ["organization_id"], name: "index_participations_on_organization_id", using: :btree
  add_index "participations", ["user_id"], name: "index_participations_on_user_id", using: :btree

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
    t.string   "name",                                null: false
    t.string   "lastname",                            null: false
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_orders", force: true do |t|
    t.string   "code"
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "user_assigned_id"
    t.integer  "organization_id"
    t.integer  "organization_assigned_id"
    t.integer  "bill_order_id"
    t.integer  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "work_orders", ["bill_order_id"], name: "index_work_orders_on_bill_order_id", using: :btree
  add_index "work_orders", ["organization_id"], name: "index_work_orders_on_organization_id", using: :btree
  add_index "work_orders", ["user_id"], name: "index_work_orders_on_user_id", using: :btree

end
