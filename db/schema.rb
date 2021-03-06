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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110102233605) do

  create_table "account_types", :force => true do |t|
    t.string   "title"
    t.integer  "debit"
    t.integer  "credit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "number"
    t.integer  "account_type_id"
    t.string   "title"
    t.integer  "bookable",        :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["id"], :name => "index_accounts_on_id"

  create_table "transactions", :force => true do |t|
    t.date     "booking_date"
    t.integer  "debit_id"
    t.integer  "credit_id"
    t.float    "amount"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["id"], :name => "index_transactions_on_id"

end
