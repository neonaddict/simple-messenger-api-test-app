class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :user

  def user
    UserSerializer.new(object.user)
  end
end
