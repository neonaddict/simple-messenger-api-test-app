class CreateChatUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_users do |t|
      t.belongs_to :chat
      t.belongs_to :user
      t.timestamps
    end
  end
end
