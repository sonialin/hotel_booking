class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :location
end
