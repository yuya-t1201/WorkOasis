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

ActiveRecord::Schema[7.0].define(version: 2023_11_09_110430) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "workspace_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "workspace_id"], name: "index_likes_on_user_id_and_workspace_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
    t.index ["workspace_id"], name: "index_likes_on_workspace_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "rating", default: 0, null: false
    t.integer "integer", default: 0, null: false
    t.bigint "user_id", null: false
    t.bigint "workspace_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["workspace_id"], name: "index_reviews_on_workspace_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "workspace_tags", force: :cascade do |t|
    t.bigint "workspace_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_workspace_tags_on_tag_id"
    t.index ["workspace_id"], name: "index_workspace_tags_on_workspace_id"
  end

  create_table "workspaces", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.text "address", null: false
    t.integer "price", default: 0
    t.text "recommendation"
    t.string "workspace_image"
    t.float "latitude"
    t.float "longitude"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spot_type", null: false
    t.index ["address"], name: "index_workspaces_on_address", unique: true
    t.index ["title"], name: "index_workspaces_on_title", unique: true
    t.index ["user_id"], name: "index_workspaces_on_user_id"
  end

  add_foreign_key "likes", "users"
  add_foreign_key "likes", "workspaces"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "workspaces"
  add_foreign_key "workspace_tags", "tags"
  add_foreign_key "workspace_tags", "workspaces"
end
