class ChatSerializer < ActiveModel::Serializer
  attributes :id, :title

  has_many :messages

  attribute :unread_messages_count do
    object.unread_messages_by_user(@instance_options[:user_id]).count
  end
end
