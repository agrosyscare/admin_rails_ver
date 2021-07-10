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

ActiveRecord::Schema.define(version: 2021_07_10_062443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arduinos", force: :cascade do |t|
    t.string "model"
    t.string "serial"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "burlesque_admin_groups", force: :cascade do |t|
    t.bigint "group_id"
    t.string "adminable_type"
    t.bigint "adminable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adminable_type", "adminable_id"], name: "by_adminable"
    t.index ["group_id"], name: "index_burlesque_admin_groups_on_group_id"
  end

  create_table "burlesque_admin_roles", force: :cascade do |t|
    t.bigint "role_id"
    t.string "authorizable_type"
    t.bigint "authorizable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authorizable_type", "authorizable_id"], name: "by_authorizable"
    t.index ["role_id"], name: "index_burlesque_admin_roles_on_role_id"
  end

  create_table "burlesque_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "burlesque_role_groups", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_burlesque_role_groups_on_group_id"
    t.index ["role_id"], name: "index_burlesque_role_groups_on_role_id"
  end

  create_table "burlesque_roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "environmental_conditions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "environmental_settings", force: :cascade do |t|
    t.jsonb "config", default: {}, null: false
    t.bigint "floor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["floor_id"], name: "index_environmental_settings_on_floor_id"
  end

  create_table "floors", force: :cascade do |t|
    t.string "name"
    t.string "plant_type"
    t.bigint "greenhouse_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["greenhouse_id"], name: "index_floors_on_greenhouse_id"
  end

  create_table "greenhouses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "humidity_readings", force: :cascade do |t|
    t.decimal "reading", precision: 5, scale: 2
    t.string "status"
    t.bigint "sensor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sensor_id"], name: "index_humidity_readings_on_sensor_id"
  end

  create_table "root_moisture_readings", force: :cascade do |t|
    t.decimal "reading", precision: 5, scale: 2
    t.string "status"
    t.bigint "sensor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sensor_id"], name: "index_root_moisture_readings_on_sensor_id"
  end

  create_table "sensors", force: :cascade do |t|
    t.string "model"
    t.string "serial"
    t.bigint "environmental_condition_id", null: false
    t.bigint "arduino_id", null: false
    t.bigint "floor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["arduino_id"], name: "index_sensors_on_arduino_id"
    t.index ["environmental_condition_id"], name: "index_sensors_on_environmental_condition_id"
    t.index ["floor_id"], name: "index_sensors_on_floor_id"
  end

  create_table "temperature_readings", force: :cascade do |t|
    t.decimal "reading", precision: 5, scale: 2
    t.string "status"
    t.bigint "sensor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sensor_id"], name: "index_temperature_readings_on_sensor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "rut"
    t.string "firstname"
    t.string "middlename"
    t.string "lastname"
    t.string "mothername"
    t.string "phone"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "device_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.jsonb "object"
    t.jsonb "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "burlesque_admin_groups", "burlesque_groups", column: "group_id"
  add_foreign_key "burlesque_admin_roles", "burlesque_roles", column: "role_id"
  add_foreign_key "burlesque_role_groups", "burlesque_groups", column: "group_id"
  add_foreign_key "burlesque_role_groups", "burlesque_roles", column: "role_id"
  add_foreign_key "environmental_settings", "floors"
  add_foreign_key "floors", "greenhouses"
  add_foreign_key "humidity_readings", "sensors"
  add_foreign_key "root_moisture_readings", "sensors"
  add_foreign_key "sensors", "arduinos"
  add_foreign_key "sensors", "environmental_conditions"
  add_foreign_key "sensors", "floors"
  add_foreign_key "temperature_readings", "sensors"
end
