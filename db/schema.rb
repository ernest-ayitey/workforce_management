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

ActiveRecord::Schema[7.1].define(version: 2024_09_27_161041) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leave_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_leave_types_on_name", unique: true
  end

  create_table "monthly_schedules", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_monthly_schedules_on_department_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "message"
    t.boolean "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_permissions_on_name", unique: true
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "permission_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "shift_swap_requests", force: :cascade do |t|
    t.bigint "requesting_user_id", null: false
    t.bigint "requested_user_id", null: false
    t.bigint "shift_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requested_user_id"], name: "index_shift_swap_requests_on_requested_user_id"
    t.index ["requesting_user_id"], name: "index_shift_swap_requests_on_requesting_user_id"
    t.index ["shift_id"], name: "index_shift_swap_requests_on_shift_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.bigint "weekly_shift_pattern_id", null: false
    t.string "shift_type"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weekly_shift_pattern_id"], name: "index_shifts_on_weekly_shift_pattern_id"
  end

  create_table "time_off_requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "leave_type_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.text "reason"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leave_type_id"], name: "index_time_off_requests_on_leave_type_id"
    t.index ["user_id"], name: "index_time_off_requests_on_user_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "course_name"
    t.date "completion_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trainings_on_user_id"
  end

  create_table "user_departments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "department_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_user_departments_on_department_id"
    t.index ["user_id"], name: "index_user_departments_on_user_id"
  end

  create_table "user_shifts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shift_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shift_id"], name: "index_user_shifts_on_shift_id"
    t.index ["user_id"], name: "index_user_shifts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.bigint "role_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "weekly_shift_patterns", force: :cascade do |t|
    t.bigint "monthly_schedule_id", null: false
    t.integer "week_number"
    t.integer "night_shift_count"
    t.integer "day_shift_count"
    t.integer "evening_shift_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["monthly_schedule_id"], name: "index_weekly_shift_patterns_on_monthly_schedule_id"
  end

  add_foreign_key "monthly_schedules", "departments"
  add_foreign_key "notifications", "users"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "shift_swap_requests", "shifts"
  add_foreign_key "shift_swap_requests", "users", column: "requested_user_id"
  add_foreign_key "shift_swap_requests", "users", column: "requesting_user_id"
  add_foreign_key "shifts", "weekly_shift_patterns"
  add_foreign_key "time_off_requests", "leave_types"
  add_foreign_key "time_off_requests", "users"
  add_foreign_key "trainings", "users"
  add_foreign_key "user_departments", "departments"
  add_foreign_key "user_departments", "users"
  add_foreign_key "user_shifts", "shifts"
  add_foreign_key "user_shifts", "users"
  add_foreign_key "users", "roles"
  add_foreign_key "weekly_shift_patterns", "monthly_schedules"
end
