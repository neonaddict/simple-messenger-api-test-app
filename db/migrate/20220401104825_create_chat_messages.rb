class CreateChatMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_messages do |t|
      t.text :content
      t.belongs_to :chat
      t.belongs_to :user
      t.belongs_to :reply_chat_message_id
      t.timestamps
    end
  end
end
