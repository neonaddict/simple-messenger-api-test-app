class AddReadByToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :chat_messages, :read_by, :integer, array: true, default: []
  end
end
