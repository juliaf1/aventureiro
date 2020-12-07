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

ActiveRecord::Schema.define(version: 2020_12_05_162343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "boat_journey_reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "boat_journey_id", null: false
    t.integer "number_passengers"
    t.integer "total_price"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boat_journey_id"], name: "index_boat_journey_reservations_on_boat_journey_id"
    t.index ["user_id"], name: "index_boat_journey_reservations_on_user_id"
  end

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
    t.integer "status"
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

  create_table "full_periods", force: :cascade do |t|
    t.bigint "campsite_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campsite_id"], name: "index_full_periods_on_campsite_id"
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
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "boat_journey_reservations", "boat_journeys"
  add_foreign_key "boat_journey_reservations", "users"
  add_foreign_key "boat_journeys", "boats"
  add_foreign_key "boats", "users"
  add_foreign_key "campsite_reservations", "campsites"
  add_foreign_key "campsite_reservations", "users"
  add_foreign_key "campsites", "users"
  add_foreign_key "full_periods", "campsites"
end
