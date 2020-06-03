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

ActiveRecord::Schema.define(version: 2020_06_02_222925) do

  create_table "comments", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "image_id"
    t.string "content", null: false
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["image_id"], name: "index_comments_on_image_id"
    t.index ["parent_id"], name: "index_comments_on_parent_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "uploaded_by_id", null: false
    t.binary "stream", null: false
    t.string "extension", null: false
    t.string "description"
    t.boolean "is_private", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"uploaded_by\"", name: "index_images_on_uploaded_by"
    t.index ["extension"], name: "index_images_on_extension"
    t.index ["is_private"], name: "index_images_on_is_private"
    t.index ["uploaded_by_id"], name: "index_images_on_uploaded_by_id"
  end

  create_table "jwt_blacklist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp"
    t.index ["jti"], name: "index_jwt_blacklist_on_jti"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "username", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "images", "users", column: "uploaded_by_id"
end
