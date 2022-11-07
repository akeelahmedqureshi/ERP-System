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

ActiveRecord::Schema[7.0].define(version: 2022_11_07_100615) do
  create_table "attendences", force: :cascade do |t|
    t.time "punch_in"
    t.time "punch_out"
    t.time "total_time"
    t.integer "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_attendences_on_employee_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string "subject"
    t.string "description"
    t.string "priority"
    t.integer "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_issues_on_employee_id"
  end

  create_table "leaves", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.integer "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_leaves_on_employee_id"
  end

  create_table "notices", force: :cascade do |t|
    t.string "subject"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.string "project_description"
    t.string "project_deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendences", "employees"
  add_foreign_key "issues", "employees"
  add_foreign_key "leaves", "employees"
end
