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

ActiveRecord::Schema.define(version: 2018_04_05_134834) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounting_accounts", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.boolean "contra"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_accounting_accounts_on_code", unique: true
    t.index ["name"], name: "index_accounting_accounts_on_name", unique: true
    t.index ["type"], name: "index_accounting_accounts_on_type"
  end

  create_table "accounting_amounts", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "entry_id"
    t.string "type"
    t.string "commercial_document_type"
    t.bigint "commercial_document_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "entry_id"], name: "index_accounting_amounts_on_account_id_and_entry_id"
    t.index ["account_id"], name: "index_accounting_amounts_on_account_id"
    t.index ["commercial_document_type", "commercial_document_id"], name: "index_commercial_document_on_amounts"
    t.index ["entry_id", "account_id"], name: "index_accounting_amounts_on_entry_id_and_account_id"
    t.index ["entry_id"], name: "index_accounting_amounts_on_entry_id"
    t.index ["type"], name: "index_accounting_amounts_on_type"
  end

  create_table "accounting_entries", force: :cascade do |t|
    t.datetime "date"
    t.string "reference_number"
    t.string "description"
    t.string "commercial_document_type"
    t.bigint "commercial_document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commercial_document_type", "commercial_document_id"], name: "index_commercial_document_on_entries"
    t.index ["reference_number"], name: "index_accounting_entries_on_reference_number", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_charges", force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "charge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_activity_charges_on_activity_id"
    t.index ["charge_id"], name: "index_activity_charges_on_charge_id"
  end

  create_table "business_activities", force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "quantity", default: "1.0"
    t.index ["activity_id"], name: "index_business_activities_on_activity_id"
    t.index ["business_id"], name: "index_business_activities_on_business_id"
  end

  create_table "business_owners", force: :cascade do |t|
    t.string "owner_type"
    t.bigint "owner_id"
    t.bigint "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_business_owners_on_business_id"
    t.index ["owner_type", "owner_id"], name: "index_business_owners_on_owner_type_and_owner_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mode_of_payment_id"
    t.index ["mode_of_payment_id"], name: "index_businesses_on_mode_of_payment_id"
  end

  create_table "chargeables", force: :cascade do |t|
    t.string "charged_type"
    t.bigint "charged_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "charge_id"
    t.boolean "can_be_deferred", default: false
    t.index ["charge_id"], name: "index_chargeables_on_charge_id"
    t.index ["charged_type", "charged_id"], name: "index_chargeables_on_charged_type_and_charged_id"
  end

  create_table "charges", force: :cascade do |t|
    t.string "name"
    t.bigint "revenue_account_id"
    t.integer "charge_type"
    t.bigint "accounts_receivable_account_id"
    t.decimal "amount"
    t.decimal "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "deferred_income_account_id"
    t.bigint "penalty_account_id"
    t.boolean "default_charge", default: false
    t.index ["accounts_receivable_account_id"], name: "index_charges_on_accounts_receivable_account_id"
    t.index ["charge_type"], name: "index_charges_on_charge_type"
    t.index ["deferred_income_account_id"], name: "index_charges_on_deferred_income_account_id"
    t.index ["penalty_account_id"], name: "index_charges_on_penalty_account_id"
    t.index ["revenue_account_id"], name: "index_charges_on_revenue_account_id"
  end

  create_table "documentary_requirement_charges", force: :cascade do |t|
    t.bigint "charge_id"
    t.bigint "documentary_requirement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charge_id"], name: "index_documentary_requirement_charges_on_charge_id"
    t.index ["documentary_requirement_id"], name: "index_doc_requirement_on_doc_requirement_charges"
  end

  create_table "documentary_requirements", force: :cascade do |t|
    t.bigint "office_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_documentary_requirements_on_office_id"
  end

  create_table "gross_sale_charges", force: :cascade do |t|
    t.bigint "charge_id"
    t.bigint "gross_sale_id"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charge_id"], name: "index_gross_sale_charges_on_charge_id"
    t.index ["gross_sale_id"], name: "index_gross_sale_charges_on_gross_sale_id"
  end

  create_table "gross_sales", force: :cascade do |t|
    t.decimal "gross_sale"
    t.bigint "business_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "date_entered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_gross_sales_on_business_id"
  end

  create_table "mode_of_payment_schedules", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "mode_of_payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mode_of_payment_id"], name: "index_mode_of_payment_schedules_on_mode_of_payment_id"
  end

  create_table "mode_of_payments", force: :cascade do |t|
    t.string "name"
    t.decimal "no_of_payments_per_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_mode_of_payments_on_name", unique: true
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promotions", force: :cascade do |t|
    t.integer "promo_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_promotions_on_code", unique: true
    t.index ["promo_type"], name: "index_promotions_on_promo_type"
  end

  create_table "redeemed_promotions", force: :cascade do |t|
    t.string "redeemer_type"
    t.bigint "redeemer_id"
    t.bigint "promotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_redeemed_promotions_on_promotion_id"
    t.index ["redeemer_type", "redeemer_id"], name: "index_redeemed_promotions_on_redeemer_type_and_redeemer_id"
  end

  create_table "taxes", force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxpayers", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounting_amounts", "accounting_accounts", column: "account_id"
  add_foreign_key "accounting_amounts", "accounting_entries", column: "entry_id"
  add_foreign_key "activity_charges", "activities"
  add_foreign_key "activity_charges", "charges"
  add_foreign_key "business_activities", "activities"
  add_foreign_key "business_activities", "businesses"
  add_foreign_key "business_owners", "businesses"
  add_foreign_key "businesses", "mode_of_payments"
  add_foreign_key "chargeables", "charges"
  add_foreign_key "charges", "accounting_accounts", column: "accounts_receivable_account_id"
  add_foreign_key "charges", "accounting_accounts", column: "deferred_income_account_id"
  add_foreign_key "charges", "accounting_accounts", column: "penalty_account_id"
  add_foreign_key "charges", "accounting_accounts", column: "revenue_account_id"
  add_foreign_key "documentary_requirement_charges", "charges"
  add_foreign_key "documentary_requirement_charges", "documentary_requirements"
  add_foreign_key "documentary_requirements", "offices"
  add_foreign_key "gross_sale_charges", "charges"
  add_foreign_key "gross_sale_charges", "gross_sales"
  add_foreign_key "gross_sales", "businesses"
  add_foreign_key "mode_of_payment_schedules", "mode_of_payments"
  add_foreign_key "redeemed_promotions", "promotions"
end
