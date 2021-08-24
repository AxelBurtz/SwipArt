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

ActiveRecord::Schema.define(version: 2021_08_24_094657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artworks", force: :cascade do |t|
    t.string "title"
    t.string "mouvement"
    t.string "museum"
    t.integer "creation_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "author_id"
    t.bigint "type_id"
    t.index ["author_id"], name: "index_artworks_on_author_id"
    t.index ["type_id"], name: "index_artworks_on_type_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "exhibition_authors", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.bigint "exhibition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_exhibition_authors_on_author_id"
    t.index ["exhibition_id"], name: "index_exhibition_authors_on_exhibition_id"
  end

  create_table "exhibition_types", force: :cascade do |t|
    t.bigint "type_id", null: false
    t.bigint "exhibition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exhibition_id"], name: "index_exhibition_types_on_exhibition_id"
    t.index ["type_id"], name: "index_exhibition_types_on_type_id"
  end

  create_table "exhibitions", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "museum"
    t.integer "price_expo"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.string "favoritable_type", null: false
    t.bigint "favoritable_id", null: false
    t.string "favoritor_type", null: false
    t.bigint "favoritor_id", null: false
    t.string "scope", default: "favorite", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blocked"], name: "index_favorites_on_blocked"
    t.index ["favoritable_id", "favoritable_type"], name: "fk_favoritables"
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable_type_and_favoritable_id"
    t.index ["favoritor_id", "favoritor_type"], name: "fk_favorites"
    t.index ["favoritor_type", "favoritor_id"], name: "index_favorites_on_favoritor_type_and_favoritor_id"
    t.index ["scope"], name: "index_favorites_on_scope"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "exhibition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exhibition_id"], name: "index_reviews_on_exhibition_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_exhibitions", force: :cascade do |t|
    t.datetime "date"
    t.integer "price"
    t.string "status"
    t.bigint "user_id", null: false
    t.bigint "exhibition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exhibition_id"], name: "index_user_exhibitions_on_exhibition_id"
    t.index ["user_id"], name: "index_user_exhibitions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "artworks", "authors"
  add_foreign_key "artworks", "types"
  add_foreign_key "exhibition_authors", "authors"
  add_foreign_key "exhibition_authors", "exhibitions"
  add_foreign_key "exhibition_types", "exhibitions"
  add_foreign_key "exhibition_types", "types"
  add_foreign_key "reviews", "exhibitions"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_exhibitions", "exhibitions"
  add_foreign_key "user_exhibitions", "users"
end
