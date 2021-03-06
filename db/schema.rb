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

ActiveRecord::Schema.define(version: 2020_07_18_123338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "checkin_on"
    t.date "checkout_on"
    t.integer "value"
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "castle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["castle_id"], name: "index_bookings_on_castle_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "castles", force: :cascade do |t|
    t.string "address"
    t.string "title"
    t.string "photo"
    t.integer "price"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "city"
    t.string "zipcode"
    t.string "country"
    t.index ["user_id"], name: "index_castles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "gender_preferences"
    t.text "description"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "castles"
  add_foreign_key "bookings", "users"
  add_foreign_key "castles", "users"
  add_foreign_key "reviews", "bookings"
end
