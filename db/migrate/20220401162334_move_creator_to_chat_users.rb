class MoveCreatorToChatUsers < ActiveRecord::Migration[6.1]
  def up
    remove_column :chats, :creator_id
    add_column :chat_users, :creator, :boolean, default: false
    add_column :chat_users, :admin, :boolean, default: false
  end

  def down
    add_reference :chats, :creator
    remove_column :chat_users, :creator
    remove_column :chat_users, :admin
  end
end
