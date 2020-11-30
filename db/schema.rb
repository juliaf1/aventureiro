# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_30_165651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boat_journeys", force: :cascade do |t|
    t.bigint "boat_id", null: false
    t.datetime "departure_time"
    t.string "travel_duration"
    t.integer "price_person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boat_id"], name: "index_boat_journeys_on_boat_id"
  end

  create_table "boats", force: :cascade do |t|
    t.string "name"
    t.integer "min_occupation"
    t.integer "max_occupation"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_boats_on_user_id"
  end

  create_table "campsite_reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "campsite_id", null: false
    t.date "check_in"
    t.date "check_out"
    t.text "description"
    t.integer "number_guests"
    t.integer "total_price"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campsite_id"], name: "index_campsite_reservations_on_campsite_id"
    t.index ["user_id"], name: "index_campsite_reservations_on_user_id"
  end

  create_table "campsites", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "daily_price"
    t.string "availability"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_campsites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "local", default: false, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.date "birth_date"
    t.string "address"
    t.text "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boat_journeys", "boats"
  add_foreign_key "boats", "users"
  add_foreign_key "campsite_reservations", "campsites"
  add_foreign_key "campsite_reservations", "users"
  add_foreign_key "campsites", "users"
end
