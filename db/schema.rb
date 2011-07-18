# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110718102603) do

  create_table "batches", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "submit_date"
    t.string   "grp_leader"
    t.string   "contact_person"
    t.text     "batch_comment"
    t.string   "sample_type"
    t.string   "extraction"
    t.string   "cleanup"
    t.string   "suspension"
    t.string   "preparation"
    t.string   "sequencing"
    t.string   "collect"
    t.integer  "samp_no"
  end

  create_table "samples", :force => true do |t|
    t.integer  "batch_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "organism"
    t.decimal  "ini_conc"
    t.decimal  "ini_vol"
    t.string   "samp_comment"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
