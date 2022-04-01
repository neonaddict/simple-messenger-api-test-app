class CreateChatMessageAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_message_attachments do |t|
      t.belongs_to :chat_message
      t.string :url
      t.timestamps
    end
  end
end
