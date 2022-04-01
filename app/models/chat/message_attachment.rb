class Chat::MessageAttachment < ApplicationRecord
  belongs_to :chat_message
end
