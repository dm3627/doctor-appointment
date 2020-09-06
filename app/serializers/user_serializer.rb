class UserSerializer < ActiveModel::Serializer
  attributes :id, :type, :email, :first_name, :last_name, :access_token
end
