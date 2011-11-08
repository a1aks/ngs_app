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

ActiveRecord::Schema.define(:version => 20110829155515) do

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
    t.string   "multiplex"
    t.string   "bioinfo"
    t.integer  "user_id"
    t.string   "status"
    t.integer  "multi_value"
  end

  create_table "qcs", :force => true do |t|
    t.integer  "sample_id"
    t.decimal  "conc",       :precision => 4, :scale => 3, :default => 0.0
    t.decimal  "ratio1",     :precision => 4, :scale => 3, :default => 0.0
    t.decimal  "ratio2",     :precision => 4, :scale => 3, :default => 0.0
    t.decimal  "agilent",    :precision => 4, :scale => 1, :default => 0.0
    t.decimal  "qubit",      :precision => 4, :scale => 3, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "result"
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
    t.integer  "read_no"
    t.decimal  "conc",          :precision => 4, :scale => 3, :default => 0.0
    t.decimal  "ratio1",        :precision => 4, :scale => 3, :default => 0.0
    t.decimal  "ratio2",        :precision => 4, :scale => 1, :default => 0.0
    t.decimal  "agilent",       :precision => 4, :scale => 3, :default => 0.0
    t.decimal  "qubit",         :precision => 4, :scale => 3, :default => 0.0
    t.string   "result"
    t.decimal  "kapa",          :precision => 4, :scale => 3, :default => 0.0
    t.date     "prepared"
    t.decimal  "lib_qubit",     :precision => 4, :scale => 3, :default => 0.0
    t.decimal  "lib_agilent",   :precision => 4, :scale => 3, :default => 0.0
    t.decimal  "lib_conc",      :precision => 4, :scale => 3, :default => 0.0
    t.string   "lib_result"
    t.string   "lib_qc_result"
    t.date     "run_date"
    t.string   "flow_cell"
    t.string   "lane"
    t.decimal  "pm",            :precision => 4, :scale => 3, :default => 0.0
    t.text     "run_comments"
    t.string   "result_run"
    t.text     "lib_comment"
  end

  create_table "sequences", :force => true do |t|
    t.string   "organism"
    t.string   "run_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "comments"
    t.integer  "batch_id"
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
    t.boolean  "admin",              :default => false
    t.string   "lname"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
