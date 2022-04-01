class UserSerializer < ActiveModel::Serializer
  attributes :id, :avatar_url

  attribute :full_name do
    [object.first_name, object.last_name].join(' ')
  end
end
