class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :taste, :employee, :cash, :appetite, :provider, :uid, :email
end
