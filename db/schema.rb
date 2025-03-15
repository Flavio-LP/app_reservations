# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_15_000823) do
  create_schema "db"

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.date "dt_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "person"
    t.datetime "created_at", precision: nil
    t.bigint "user_id", null: false
    t.bigint "client_id", null: false
    t.bigint "time_reservation_id", null: false
    t.index ["client_id"], name: "index_reservations_on_client_id"
    t.index ["time_reservation_id"], name: "index_reservations_on_time_reservation_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "time_reservations", force: :cascade do |t|
    t.string "hour"
    t.integer "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.boolean "admin"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reservations", "clients"
  add_foreign_key "reservations", "time_reservations"
  add_foreign_key "reservations", "users"
end
