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

ActiveRecord::Schema.define(version: 20180224120911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avaliation_categories", force: :cascade do |t|
    t.integer "operation_id"
    t.string "name"
    t.float "minimum_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "avaliation_items", force: :cascade do |t|
    t.integer "operation_id"
    t.integer "avaliation_category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manager_avaliation_items", force: :cascade do |t|
    t.integer "manager_avaliation_id"
    t.integer "avaliation_item_id"
    t.float "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manager_avaliations", force: :cascade do |t|
    t.integer "operation_id"
    t.integer "avaliation_category_id"
    t.text "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "float"
    t.float "minimum_value"
  end

  create_table "manager_objectives", force: :cascade do |t|
    t.string "name"
    t.integer "operation_id"
    t.float "base_value"
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.integer "store_id"
    t.string "name"
    t.string "cpf"
    t.string "observation"
    t.string "telephone"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operations", force: :cascade do |t|
    t.integer "store_id"
    t.string "name"
    t.text "observation"
    t.date "started_at"
    t.date "ended_at"
    t.float "value_start"
    t.float "value_goal"
    t.float "percent_start"
    t.float "percent_goal"
    t.float "percent_fixed_goal"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "indirect_team_percent"
    t.integer "indirect_team_quantity"
    t.float "manager_prize_point"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "operation_id"
    t.string "integer"
    t.integer "seller_id"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sellers", force: :cascade do |t|
    t.integer "store_id"
    t.string "name"
    t.string "cpf"
    t.string "code"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "store_users", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "email"
    t.string "password"
    t.boolean "status", default: true
    t.integer "privilege", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "cnpj"
    t.string "telephone"
    t.string "city"
    t.string "state"
    t.string "cep"
    t.string "address"
    t.string "neigh"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.text "bio"
    t.string "avatar"
    t.boolean "status", default: true
    t.integer "privilege", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
