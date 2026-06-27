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

ActiveRecord::Schema[8.1].define(version: 2026_06_27_042942) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "actions", force: :cascade do |t|
    t.integer "action_order"
    t.string "action_type"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.bigint "hand_id", null: false
    t.boolean "is_all_in"
    t.bigint "player_id", null: false
    t.string "street"
    t.datetime "updated_at", null: false
    t.index ["hand_id"], name: "index_actions_on_hand_id"
    t.index ["player_id"], name: "index_actions_on_player_id"
  end

  create_table "boards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "flop1"
    t.string "flop2"
    t.string "flop3"
    t.bigint "hand_id", null: false
    t.string "river"
    t.string "turn"
    t.datetime "updated_at", null: false
    t.index ["hand_id"], name: "index_boards_on_hand_id"
  end

  create_table "hands", force: :cascade do |t|
    t.integer "ante"
    t.integer "blind_big"
    t.integer "blind_small"
    t.integer "button_seat"
    t.datetime "created_at", null: false
    t.integer "table_size"
    t.bigint "tournament_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["tournament_id"], name: "index_hands_on_tournament_id"
    t.index ["user_id"], name: "index_hands_on_user_id"
  end

  create_table "hole_cards", force: :cascade do |t|
    t.string "card1"
    t.string "card2"
    t.datetime "created_at", null: false
    t.bigint "hand_id", null: false
    t.bigint "player_id", null: false
    t.datetime "updated_at", null: false
    t.index ["hand_id"], name: "index_hole_cards_on_hand_id"
    t.index ["player_id"], name: "index_hole_cards_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "hand_id", null: false
    t.boolean "is_hero"
    t.string "name"
    t.integer "seat_number"
    t.integer "stack"
    t.datetime "updated_at", null: false
    t.index ["hand_id"], name: "index_players_on_hand_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.integer "avg_stack"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "actions", "hands"
  add_foreign_key "actions", "players"
  add_foreign_key "boards", "hands"
  add_foreign_key "hands", "tournaments"
  add_foreign_key "hands", "users"
  add_foreign_key "hole_cards", "hands"
  add_foreign_key "hole_cards", "players"
  add_foreign_key "players", "hands"
end
