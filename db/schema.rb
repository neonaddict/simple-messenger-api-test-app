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

ActiveRecord::Schema.define(version: 2022_04_01_175657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_message_attachments", force: :cascade do |t|
    t.bigint "chat_message_id"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_message_id"], name: "index_chat_message_attachments_on_chat_message_id"
  end

  create_table "chat_messages", force: :cascade do |t|
    t.text "content"
    t.bigint "chat_id"
    t.bigint "user_id"
    t.bigint "reply_chat_message_id_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "read_by", default: [], array: true
    t.index ["chat_id"], name: "index_chat_messages_on_chat_id"
    t.index ["reply_chat_message_id_id"], name: "index_chat_messages_on_reply_chat_message_id_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

  create_table "chat_users", force: :cascade do |t|
    t.bigint "chat_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "creator", default: false
    t.boolean "admin", default: false
    t.index ["chat_id"], name: "index_chat_users_on_chat_id"
    t.index ["user_id"], name: "index_chat_users_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "nickname", null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "avatar_url"
  end

end
