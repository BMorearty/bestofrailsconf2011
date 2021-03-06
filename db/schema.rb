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

ActiveRecord::Schema.define(:version => 20110522020237) do

  create_table "presentations", :force => true do |t|
    t.string   "title",                                                          :null => false
    t.text     "description_html",                                               :null => false
    t.decimal  "rating",            :precision => 5, :scale => 2
    t.integer  "num_ratings",                                     :default => 0, :null => false
    t.string   "presentation_type"
    t.text     "url",                                                            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "speakers"
  end

  add_index "presentations", ["rating"], :name => "index_presentations_on_rating"

  create_table "scrapes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
