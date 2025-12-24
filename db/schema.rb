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

ActiveRecord::Schema[8.1].define(version: 2025_12_24_064519) do
  create_table "kasurs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "deskripsi"
    t.decimal "harga_per_hari", precision: 10
    t.string "nama"
    t.string "status"
    t.datetime "updated_at", null: false
  end

  create_table "penyewas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "alamat"
    t.datetime "created_at", null: false
    t.string "identitas"
    t.string "nama"
    t.string "nomor_telepon"
    t.datetime "updated_at", null: false
  end

  create_table "sewas", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "kasur_id", null: false
    t.bigint "penyewa_id", null: false
    t.string "status"
    t.date "tanggal_mulai"
    t.date "tanggal_selesai"
    t.decimal "total_harga", precision: 10
    t.datetime "updated_at", null: false
    t.index ["kasur_id"], name: "index_sewas_on_kasur_id"
    t.index ["penyewa_id"], name: "index_sewas_on_penyewa_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "password_digest"
    t.datetime "updated_at", null: false
    t.string "username"
  end

  add_foreign_key "sewas", "kasurs"
  add_foreign_key "sewas", "penyewas"
end
