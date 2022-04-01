class Chat::Message < ApplicationRecord
  has_many :attachments, class_name: 'Chat::MessageAttachment', foreign_key: 'chat_message_id'

  belongs_to :chat
  belongs_to :user
  belongs_to :reply_chat_message, class_name: 'Chat::Message', optional: true
end
