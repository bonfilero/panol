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

ActiveRecord::Schema.define(version: 20150805151844) do

  create_table "article_has_buyorders", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "buyorder_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "article_has_buyorders", ["article_id"], name: "index_article_has_buyorders_on_article_id"
  add_index "article_has_buyorders", ["buyorder_id"], name: "index_article_has_buyorders_on_buyorder_id"

  create_table "articles", force: :cascade do |t|
    t.string   "nombre"
    t.text     "desc"
    t.decimal  "stockmin",         default: 0.0
    t.integer  "lotecompra"
    t.string   "unidad"
    t.string   "unidadcompra"
    t.decimal  "ucompraporudeuso"
    t.integer  "family_id"
    t.integer  "sfamily_id"
    t.integer  "ssfamily_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.decimal  "saldo",            default: 0.0
    t.string   "state"
  end

  add_index "articles", ["family_id"], name: "index_articles_on_family_id"
  add_index "articles", ["sfamily_id"], name: "index_articles_on_sfamily_id"
  add_index "articles", ["ssfamily_id"], name: "index_articles_on_ssfamily_id"

  create_table "balances", force: :cascade do |t|
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "output_id"
    t.integer  "input_id"
    t.decimal  "saldo"
    t.string   "comment"
  end

  add_index "balances", ["article_id"], name: "index_balances_on_article_id"
  add_index "balances", ["input_id"], name: "index_balances_on_input_id"
  add_index "balances", ["output_id"], name: "index_balances_on_output_id"

  create_table "buyorders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "nombre"
    t.string   "codigo"
    t.integer  "ssystem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "equipment", ["ssystem_id"], name: "index_equipment_on_ssystem_id"

  create_table "families", force: :cascade do |t|
    t.string   "nombre"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inputs", force: :cascade do |t|
    t.decimal  "cantidad"
    t.integer  "article_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "remito"
    t.boolean  "devolucion", default: false
    t.string   "comment"
  end

  add_index "inputs", ["article_id"], name: "index_inputs_on_article_id"

  create_table "outputs", force: :cascade do |t|
    t.decimal  "cantidad"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "worker_id"
    t.string   "comment"
  end

  add_index "outputs", ["article_id"], name: "index_outputs_on_article_id"
  add_index "outputs", ["worker_id"], name: "index_outputs_on_worker_id"

  create_table "sfamilies", force: :cascade do |t|
    t.string   "nombre"
    t.text     "desc"
    t.integer  "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sfamilies", ["family_id"], name: "index_sfamilies_on_family_id"

  create_table "ssfamilies", force: :cascade do |t|
    t.string   "nombre"
    t.text     "desc"
    t.integer  "sfamily_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "family_id"
  end

  add_index "ssfamilies", ["family_id"], name: "index_ssfamilies_on_family_id"
  add_index "ssfamilies", ["sfamily_id"], name: "index_ssfamilies_on_sfamily_id"

  create_table "ssystems", force: :cascade do |t|
    t.string   "nombre"
    t.integer  "system_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ssystems", ["system_id"], name: "index_ssystems_on_system_id"

  create_table "systems", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", primary_key: "legajo", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", force: :cascade do |t|
    t.string   "desc"
    t.decimal  "horas"
    t.date     "fecha"
    t.integer  "equipment_id"
    t.integer  "worker_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "works", ["equipment_id"], name: "index_works_on_equipment_id"
  add_index "works", ["worker_id"], name: "index_works_on_worker_id"

end
