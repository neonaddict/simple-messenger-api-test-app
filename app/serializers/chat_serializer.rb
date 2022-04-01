class ChatSerializer < ActiveModel::Serializer
  attributes :id, :title

  attribute :unread_messages_count do
    object.unread_messages_by_user(@instance_options[:user_id]).count
  end

  attribute :last_message do
    MessageSerializer.new(object.messages.first)
  end
end
