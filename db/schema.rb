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

ActiveRecord::Schema.define(:version => 20110523001632) do

  create_table "agilezen_sources", :force => true do |t|
    t.string   "api_key"
    t.integer  "project"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agilezen_tasks", :force => true do |t|
    t.string   "external_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id"
  end

  create_table "goals", :force => true do |t|
    t.string   "name",       :limit => 100,                     :null => false
    t.string   "detail",     :limit => 1000, :default => ""
    t.boolean  "complete",                   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name",       :limit => 100,                     :null => false
    t.string   "string",     :limit => 1000, :default => ""
    t.string   "detail",     :limit => 1000, :default => ""
    t.boolean  "complete",                   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "goal_id"
  end

end
