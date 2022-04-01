class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at

  attribute :user do
    UserSerializer.new(object.user)
  end
end
