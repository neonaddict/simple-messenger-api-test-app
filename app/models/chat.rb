class Chat < ApplicationRecord
  has_many :chat_users, dependent: :destroy
  has_many :users, through: :chat_users
  has_many :messages, -> { order('chat_messages.created_at ASC NULLS LAST') }

  scope :order_by_recent_messages, lambda {
    includes(:messages).order('chat_messages.created_at DESC NULLS LAST')
  }
end
