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

ActiveRecord::Schema.define(version: 20131212164058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "town_health_records", force: true do |t|
    t.string   "geography",                               null: false
    t.integer  "pop_total_2005"
    t.integer  "pop_0_thru_19_2005"
    t.integer  "pop_over65_2005"
    t.integer  "per_cap_income_2000"
    t.integer  "num_below_200fpl_2000"
    t.decimal  "perc_below_200fpl_2000"
    t.decimal  "perc_adeq_prenatal_care"
    t.decimal  "perc_c_sections_2005_08"
    t.integer  "num_infant_deaths_2005_08"
    t.decimal  "infant_mortality_rate_per_1000_2005_08"
    t.decimal  "perc_low_birthweight_2005_08"
    t.decimal  "perc_multiple_births_2005_08"
    t.decimal  "perc_pub_financed_prenatal_care_2005_08"
    t.decimal  "perc_teen_births_2005_08"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
