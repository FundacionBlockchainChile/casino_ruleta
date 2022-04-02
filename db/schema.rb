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

ActiveRecord::Schema[7.0].define(version: 2022_04_02_192700) do
  create_table "bets", force: :cascade do |t|
    t.integer "round_id", null: false
    t.integer "jugador_id", null: false
    t.string "jugador_name"
    t.integer "bet_ammount"
    t.integer "bet_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jugador_id"], name: "index_bets_on_jugador_id"
    t.index ["round_id"], name: "index_bets_on_round_id"
  end

  create_table "jugadors", force: :cascade do |t|
    t.string "nombre"
    t.string "email"
    t.integer "total_billetera"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roullettes", force: :cascade do |t|
    t.integer "roullette_wallet"
    t.integer "time_delay"
    t.float "max_temp_week"
    t.boolean "conservative_bets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "roullette_id", null: false
    t.integer "winner_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roullette_id"], name: "index_rounds_on_roullette_id"
  end

  add_foreign_key "bets", "jugadors"
  add_foreign_key "bets", "rounds"
  add_foreign_key "rounds", "roullettes"
end
