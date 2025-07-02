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

ActiveRecord::Schema[8.0].define(version: 2025_07_02_141933) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "hours", force: :cascade do |t|
    t.time "hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_hours_on_id", unique: true
  end

  create_table "pessoas", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "nome", null: false
    t.string "sobrenome", null: false
    t.string "telefone"
    t.string "cpf"
    t.date "data_nascimento"
    t.text "endereco"
    t.boolean "dados_completos", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_pessoas_on_cpf", unique: true, where: "(cpf IS NOT NULL)"
    t.index ["user_id"], name: "index_pessoas_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "table_id", null: false
    t.datetime "hour", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pessoa_id", null: false
    t.index ["pessoa_id"], name: "index_reservations_on_pessoa_id"
    t.index ["table_id"], name: "index_reservations_on_table_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "number_table"
    t.integer "occupants"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_tables_on_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_views_on_email", unique: true
    t.index ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true
  end

  add_foreign_key "pessoas", "users"
  add_foreign_key "reservations", "pessoas"
  add_foreign_key "reservations", "tables"
  add_foreign_key "reservations", "users"
end
