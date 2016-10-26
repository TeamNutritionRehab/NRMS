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

ActiveRecord::Schema.define(version: 20161026145238) do

  create_table "admissions", force: :cascade do |t|
    t.integer  "child_id",           limit: 4,                             null: false
    t.string   "admission_type",     limit: 255, default: "new_admission", null: false
    t.datetime "Date_of_admission",                                        null: false
    t.string   "admission_criteria", limit: 255,                           null: false
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  add_index "admissions", ["child_id"], name: "index_admissions_on_child_id", using: :btree

  create_table "anthropometries", force: :cascade do |t|
    t.integer  "child_id",   limit: 4,                                        null: false
    t.decimal  "height",                 precision: 10,                       null: false
    t.decimal  "weight",                 precision: 10,                       null: false
    t.integer  "z_score",    limit: 3,                                        null: false
    t.decimal  "MUAC",                   precision: 10,                       null: false
    t.string   "oedema",     limit: 255,                default: "no_oedema", null: false
    t.decimal  "BMI",                    precision: 10
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  add_index "anthropometries", ["child_id"], name: "index_anthropometries_on_child_id", using: :btree

  create_table "children", force: :cascade do |t|
    t.string   "reg_number",              limit: 255,                 null: false
    t.string   "first_name",              limit: 25,                  null: false
    t.string   "last_name",               limit: 25,                  null: false
    t.string   "guardian_name",           limit: 60,                  null: false
    t.string   "twin_child",              limit: 255, default: "no",  null: false
    t.integer  "age",                     limit: 3
    t.string   "sex",                     limit: 255,                 null: false
    t.string   "trad_authority",          limit: 255,                 null: false
    t.string   "village",                 limit: 50,                  null: false
    t.boolean  "HIV_serostatus",                      default: false, null: false
    t.string   "maternal_HIV_serostatus", limit: 255, default: "NR",  null: false
    t.boolean  "on_ART?",                             default: false, null: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "discharges", force: :cascade do |t|
    t.integer  "child_id",           limit: 4,                       null: false
    t.datetime "date_of_discharge",                                  null: false
    t.string   "programme",          limit: 25,                      null: false
    t.text     "proposed_treatment", limit: 65535
    t.text     "proposed_diet",      limit: 65535
    t.string   "outcome",            limit: 60,    default: "cured", null: false
    t.integer  "length_of_stay",     limit: 4,                       null: false
  end

  add_index "discharges", ["child_id"], name: "index_discharges_on_child_id", using: :btree

  create_table "feed_plans", force: :cascade do |t|
    t.integer  "child_id",                 limit: 4,                  null: false
    t.decimal  "admission_weight",                     precision: 10, null: false
    t.decimal  "today_weight",                         precision: 10, null: false
    t.date     "date",                                                null: false
    t.string   "type_of_food",             limit: 255,                null: false
    t.string   "food_package",             limit: 255,                null: false
    t.integer  "amount_offered",           limit: 4,                  null: false
    t.string   "amount_left",              limit: 255,                null: false
    t.integer  "estimated_amount_vomited", limit: 4
    t.integer  "watery_diarrhoea",         limit: 4
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "feed_plans", ["child_id"], name: "index_feed_plans_on_child_id", using: :btree

  create_table "follow_ups", force: :cascade do |t|
    t.integer  "child_id",        limit: 4,                                null: false
    t.date     "last_update",                                              null: false
    t.decimal  "weight",                      precision: 10,               null: false
    t.decimal  "MUAC",                        precision: 10,               null: false
    t.integer  "z_score",         limit: 4,                                null: false
    t.decimal  "BMI",                         precision: 10
    t.string   "clinician",       limit: 255,                              null: false
    t.text     "remark",          limit: 255
    t.string   "appetite_test",   limit: 255,                default: "1", null: false
    t.string   "clinical_status", limit: 255,                              null: false
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  add_index "follow_ups", ["child_id"], name: "index_follow_ups_on_child_id", using: :btree

  create_table "routine_treatments", force: :cascade do |t|
    t.integer  "child_id",              limit: 4,   null: false
    t.date     "date",                              null: false
    t.string   "vitamin_A",             limit: 255, null: false
    t.string   "folic_acid",            limit: 20
    t.string   "amoxicilin_antibiotic", limit: 20
    t.string   "albendazole",           limit: 40
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "routine_treatments", ["child_id"], name: "index_routine_treatments_on_child_id", using: :btree

  create_table "tests", force: :cascade do |t|
    t.integer "child_id",             limit: 4,                    null: false
    t.string  "referred_by",          limit: 10,                   null: false
    t.boolean "Appetite_test",                                     null: false
    t.string  "breastfeeding",        limit: 5,                    null: false
    t.string  "complementery_food",   limit: 5,                    null: false
    t.integer "vomiting",             limit: 1,                    null: false
    t.boolean "alert",                                             null: false
    t.string  "stools",               limit: 10,                   null: false
    t.string  "yes_appetite",         limit: 255, default: "good"
    t.text    "prev_medical_history", limit: 255
    t.string  "clinician_name",       limit: 30,                   null: false
  end

  add_index "tests", ["child_id"], name: "index_tests_on_child_id", using: :btree

end
