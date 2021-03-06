class User < ApplicationRecord
  has_many :chat_users, dependent: :destroy
  has_many :chats, -> { order_by_recent_messages }, through: :chat_users
end
