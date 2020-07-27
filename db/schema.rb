# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_27_203130) do

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.string "user_id"
    t.string "order_id"
    t.string "location"
    t.string "category"
    t.string "condition"
    t.float "price"
    t.text "description", limit: 1000
  end

  create_table "orders", force: :cascade do |t|
    t.string "seller"
    t.string "buyer"
    t.string "order_type"
    t.boolean "shipping?"
    t.string "shipping_address"
    t.string "meeting_location"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
