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

ActiveRecord::Schema.define(version: 20180829094145) do

  create_table "attributes", force: :cascade do |t|
    t.string   "nama"
    t.string   "keterangan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cost_centres", force: :cascade do |t|
    t.integer  "kode"
    t.string   "nama"
    t.string   "pejabat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delegations", force: :cascade do |t|
    t.string   "nomor"
    t.date     "mulai"
    t.date     "selesai"
    t.string   "pemberi"
    t.integer  "cost_centre_pemberi_id"
    t.string   "penerima"
    t.integer  "cost_centre_penerima_id"
    t.string   "keterangan"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "directorates", force: :cascade do |t|
    t.string   "nama"
    t.string   "keterangan"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disposition_details", force: :cascade do |t|
    t.string   "nomor"
    t.string   "penerima"
    t.string   "status"
    t.string   "laporan"
    t.date     "tgl_laporan"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "cost_centre_penerima_id"
  end

  create_table "dispositions", force: :cascade do |t|
    t.string   "nomor"
    t.string   "letter_id"
    t.string   "instruksi"
    t.date     "tgl"
    t.string   "status"
    t.string   "pemberi"
    t.integer  "cost_centre_pemberi_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "letters", force: :cascade do |t|
    t.string   "no_surat",       null: false
    t.string   "sifat"
    t.string   "jenis"
    t.string   "pengirim"
    t.string   "penerima"
    t.string   "asal_surat"
    t.string   "perihal"
    t.date     "tgl_surat"
    t.date     "tgl_terima"
    t.integer  "cost_centre_id"
    t.integer  "directorate_id"
    t.string   "nama_file"
    t.string   "status"
    t.string   "delegasi"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "nama"
    t.string   "keterangan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "sqlite_user" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "types", force: :cascade do |t|
    t.string   "nama"
    t.string   "keterangan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_activities", force: :cascade do |t|
    t.string   "username"
    t.string   "controller"
    t.string   "action"
    t.string   "activity"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_activities", ["username"], name: "index_user_activities_on_username"

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "nama",            null: false
    t.string   "password_digest"
    t.string   "role"
    t.integer  "cost_centre_id"
    t.integer  "direktorat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
