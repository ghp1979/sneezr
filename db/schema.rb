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

ActiveRecord::Schema.define(version: 2021_11_24_204503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergen_reports", force: :cascade do |t|
    t.integer "tree_value", null: false
    t.string "tree_category", null: false
    t.integer "grass_value", null: false
    t.string "grass_category", null: false
    t.integer "ragweed_value", null: false
    t.string "ragweed_category", null: false
    t.integer "mold_value", null: false
    t.string "mold_category", null: false
    t.integer "dust_dander_value", null: false
    t.string "dust_dander_category", null: false
    t.bigint "zip_code_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["zip_code_id"], name: "index_allergen_reports_on_zip_code_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "zip_code_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["zip_code_id"], name: "index_users_on_zip_code_id"
  end

  create_table "zip_codes", force: :cascade do |t|
    t.string "zip_code", limit: 5, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "users", "zip_codes"
end
